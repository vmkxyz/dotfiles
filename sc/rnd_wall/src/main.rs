use std::env;
use std::fs;
use std::process::{Command, Stdio};
use std::path::Path;
use std::ffi::OsStr;
use rand::seq::SliceRandom;

fn main() {
    // Start hyprpaper if not already running
    if !is_process_running("hyprpaper") {
        Command::new("hyprpaper")
            .spawn()
            .expect("Failed to start hyprpaper");
    }

    // Path to your wallpapers folder
    let home_dir = env::var("HOME").expect("Could not get HOME environment variable");
    let wallpapers_folder = format!("{}/Pictures/wallpapers", home_dir);

    // File to store the path of the current wallpaper
    let current_wallpaper_file = format!("{}/.cache/current_wallpaper.txt", home_dir);

    // Get the path of the current wallpaper
    let current_wallpaper = get_current_wallpaper(&current_wallpaper_file);

    // Get a random wallpaper file from the folder
    let random_wallpaper = select_random_wallpaper(&wallpapers_folder, &current_wallpaper);

    println!("Selected wallpaper: {}", random_wallpaper);

    // Set the wallpaper for each monitor using hyprpaper
    set_wallpaper_for_monitors(&random_wallpaper, &wallpapers_folder);

    // Generate color schemes using pywal
    let wal_result = Command::new("wal")
        .args(&["-qnstei", &format!("{}/{}", wallpapers_folder, random_wallpaper)])
        .status()
        .expect("Failed to run wal");

    if !wal_result.success() {
        eprintln!("Failed to run wal: {:?}", wal_result);
    }

    // Copy the randomly chosen wallpaper to cache (e.g., for hyprlock)
    let cache_wallpaper_path = format!("{}/.cache/active_wallpaper.jpg", home_dir);
    fs::copy(
        format!("{}/{}", wallpapers_folder, random_wallpaper),
        &cache_wallpaper_path,
    )
    .expect("Failed to copy wallpaper to cache");

    // Update the file with the path of the new wallpaper
    fs::write(&current_wallpaper_file, &random_wallpaper)
        .expect("Failed to update current wallpaper file");

    // Restart Waybar as a background process
    if is_process_running("waybar") {
        let kill_result = Command::new("killall")
            .arg("waybar")
            .status()
            .expect("Failed to kill waybar");

        if !kill_result.success() {
            eprintln!("Failed to kill waybar: {:?}", kill_result);
        }
    }

    // Start Waybar as a background process and ignore the result
    Command::new("waybar")
        .stdin(Stdio::null())
        .stdout(Stdio::null())
        .stderr(Stdio::null())
        .spawn()
        .expect("Failed to start waybar");

    // Optionally, you can log or handle the result if needed
    // eprintln!("Waybar process id: {:?}", waybar_result.id());
}

// Function to check if a process is running
fn is_process_running(process_name: &str) -> bool {
    let output = Command::new("pidof")
        .arg(process_name)
        .output()
        .expect("Failed to execute pidof");

    let is_running = output.status.success();
    if !is_running {
        eprintln!("Process {} is not running", process_name);
    }
    is_running
}

// Function to get the path of the current wallpaper
fn get_current_wallpaper(current_wallpaper_file: &str) -> Option<String> {
    if Path::new(current_wallpaper_file).exists() {
        fs::read_to_string(current_wallpaper_file).ok()
    } else {
        None
    }
}

// Function to select a random wallpaper
fn select_random_wallpaper(wallpapers_folder: &str, current_wallpaper: &Option<String>) -> String {
    let paths: Vec<_> = fs::read_dir(wallpapers_folder)
        .expect("Could not read wallpapers folder")
        .filter_map(|entry| {
            let entry = entry.expect("Could not read directory entry");
            let path = entry.path();
            if path.extension() == Some(OsStr::new("jpg")) {
                Some(path.file_name().unwrap().to_string_lossy().into_owned())
            } else {
                None
            }
        })
        .collect();

    if paths.is_empty() {
        eprintln!("No wallpapers found in the folder");
        std::process::exit(1);
    }

    let mut rng = rand::thread_rng();
    let mut random_wallpaper = paths.choose(&mut rng).expect("No wallpapers found").to_string();

    // Loop until a new wallpaper is chosen
    while Some(random_wallpaper.as_str()) == current_wallpaper.as_deref().map(|s| s.trim()) {
        random_wallpaper = paths.choose(&mut rng).expect("No wallpapers found").to_string();
    }

    random_wallpaper
}

// Function to set the wallpaper for each monitor using hyprpaper
fn set_wallpaper_for_monitors(wallpaper: &str, wallpapers_folder: &str) {
    let monitors = get_monitors();
    if monitors.is_empty() {
        eprintln!("No monitors found");
        std::process::exit(1);
    }

    // Ensure wallpapers are set sequentially
    for monitor in monitors {
        let result = Command::new("hyprctl")
            .args(&["hyprpaper", "preload", &format!("{}/{}", wallpapers_folder, wallpaper)])
            .status();

        if let Err(e) = result {
            eprintln!("Failed to preload wallpaper for monitor {}: {}", monitor, e);
        }

        let result = Command::new("hyprctl")
            .args(&["hyprpaper", "wallpaper", &format!("{},{}", monitor, &format!("{}/{}", wallpapers_folder, wallpaper))])
            .status();

        if let Err(e) = result {
            eprintln!("Failed to set wallpaper for monitor {}: {}", monitor, e);
        }
    }
}

// Function to get the list of monitors
fn get_monitors() -> Vec<String> {
    let output = Command::new("hyprctl")
        .arg("monitors")
        .output()
        .expect("Failed to get monitors");

    let output = String::from_utf8_lossy(&output.stdout);
    let mut monitors = Vec::new();

    for line in output.lines() {
        if line.starts_with("Monitor") {
            if let Some(monitor_name) = line.split_whitespace().nth(1) {
                monitors.push(monitor_name.to_string());
            }
        }
    }

    monitors
}
