use std::env;
use std::fs;
use std::process::{Command, Stdio};
use std::path::Path;
use std::ffi::OsStr;
use rand::seq::SliceRandom;

const MAX_RECENT_WALLPAPERS: usize = 10; // Number of recent wallpapers to avoid

fn main() {
    // Start hyprpaper if not already running
    if !is_process_running("hyprpaper") {
        Command::new("hyprpaper")
            .spawn()
            .expect("Failed to start hyprpaper");
    }

    // Path to your wallpapers directory
    let home_dir = env::var("HOME").expect("Could not get HOME environment variable");
    let wallpapers_dir = format!("{}/Pictures/wallpapers", home_dir);

    // File to store the path of the current wallpaper
    let current_wallpaper_file = format!("{}/.cache/current_wallpaper.txt", home_dir);
    // File to store the last few wallpapers
    let recent_wallpapers_file = format!("{}/.cache/recent_wallpapers.txt", home_dir);

    // Get the recent wallpapers
    let mut recent_wallpapers = get_recent_wallpapers(&recent_wallpapers_file);

    // Truncate the recent wallpapers list if it exceeds the max size
    truncate_recent_wallpapers(&mut recent_wallpapers);

    // Get a random wallpaper file from the directory, excluding recent ones
    let random_wallpaper = select_random_wallpaper(&wallpapers_dir, &recent_wallpapers);

    println!("Selected wallpaper: {}", random_wallpaper);

    // Set the wallpaper for each monitor using hyprpaper
    set_wallpaper_for_monitors(&random_wallpaper, &wallpapers_dir);

    // Generate color schemes using wallust
    let wallust_result = Command::new("wallust")
        .args(&["-sq", "run", &format!("{}/{}", wallpapers_dir, random_wallpaper)])
        .status()
        .expect("Failed to run wallust");

    if !wallust_result.success() {
        eprintln!("Failed to run wallust: {:?}", wallust_result);
    }

    // Copy the randomly chosen wallpaper to cache (e.g., for hyprlock)
    let cache_wallpaper_path = format!("{}/.cache/active_wallpaper", home_dir);
    let original_extension = Path::new(&random_wallpaper)
        .extension()
        .and_then(OsStr::to_str)
        .unwrap_or("jpg"); // default to jpg if no extension found

    let cache_wallpaper_path = format!("{}.{}", cache_wallpaper_path, original_extension);

    fs::copy(
        format!("{}/{}", wallpapers_dir, random_wallpaper),
        &cache_wallpaper_path,
    )
    .expect("Failed to copy wallpaper to cache");

    // Update the file with the path of the new wallpaper
    fs::write(&current_wallpaper_file, &random_wallpaper)
        .expect("Failed to update current wallpaper file");

    // Update recent wallpapers list
    update_recent_wallpapers(&mut recent_wallpapers, &random_wallpaper, &recent_wallpapers_file);

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

// Function to get the recent wallpapers from a file
fn get_recent_wallpapers(recent_wallpapers_file: &str) -> Vec<String> {
    if Path::new(recent_wallpapers_file).exists() {
        fs::read_to_string(recent_wallpapers_file)
            .unwrap_or_else(|_| String::new())
            .lines()
            .map(|line| line.to_string())
            .collect()
    } else {
        Vec::new()
    }
}

// Function to truncate recent wallpapers list to the max size
fn truncate_recent_wallpapers(recent_wallpapers: &mut Vec<String>) {
    if recent_wallpapers.len() > MAX_RECENT_WALLPAPERS {
        recent_wallpapers.truncate(MAX_RECENT_WALLPAPERS);
    }
}

// Function to update the recent wallpapers file
fn update_recent_wallpapers(
    recent_wallpapers: &mut Vec<String>,
    new_wallpaper: &str,
    recent_wallpapers_file: &str,
) {
    // Add the new wallpaper to the start of the list
    recent_wallpapers.insert(0, new_wallpaper.to_string());

    // Truncate the list to the maximum size
    truncate_recent_wallpapers(recent_wallpapers);

    // Write the updated list back to the file
    let recent_wallpapers_data = recent_wallpapers.join("\n");
    fs::write(recent_wallpapers_file, recent_wallpapers_data)
        .expect("Failed to update recent wallpapers file");
}

// Function to get a random wallpaper, excluding recent ones
fn select_random_wallpaper(wallpapers_dir: &str, recent_wallpapers: &[String]) -> String {
    let allowed_extensions = ["jpg", "jpeg", "png", "bmp", "webp"];

    let paths: Vec<_> = fs::read_dir(wallpapers_dir)
        .expect("Could not read wallpapers directory")
        .filter_map(|entry| {
            let entry = entry.expect("Could not read directory entry");
            let path = entry.path();

            if path.extension()
                .and_then(OsStr::to_str)
                .map(|ext| allowed_extensions.contains(&ext.to_lowercase().as_str()))
                .unwrap_or(false)
                && !recent_wallpapers.contains(&path.file_name().unwrap().to_string_lossy().to_string()) {
                Some(path.file_name().unwrap().to_string_lossy().into_owned())
            } else {
                None
            }
        })
        .collect();

    if paths.is_empty() {
        eprintln!("No wallpapers found in the directory");
        std::process::exit(1);
    }

    let mut rng = rand::thread_rng();
    let random_wallpaper = paths.choose(&mut rng).expect("No wallpapers found").to_string();

    random_wallpaper
}

// Function to set the wallpaper for each monitor using hyprpaper
fn set_wallpaper_for_monitors(wallpaper: &str, wallpapers_dir: &str) {
    let monitors = get_monitors();
    if monitors.is_empty() {
        eprintln!("No monitors found");
        std::process::exit(1);
    }

    // Ensure wallpapers are set sequentially
    for monitor in monitors {
        let result = Command::new("hyprctl")
            .args(&["hyprpaper", "preload", &format!("{}/{}", wallpapers_dir, wallpaper)])
            .status();

        if let Err(e) = result {
            eprintln!("Failed to preload wallpaper for monitor {}: {}", monitor, e);
        }

        let result = Command::new("hyprctl")
            .args(&["hyprpaper", "wallpaper", &format!("{},{}", monitor, &format!("{}/{}", wallpapers_dir, wallpaper))])
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
