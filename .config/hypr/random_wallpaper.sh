#!/bin/sh

# A script to set a random wallpaper and apply it
# and its (pywal) colors to stuff
#                    __
#      _  __ __ _   / /__
#     | |/ //  ' \ /  '_/
# by  |___//_/_/_//_/\_\
# @vmkxyz on gitlab and github

# Start hyprpaper
pidof "hyprpaper" > /dev/null || hyprpaper &

# Path to your wallpapers folder
wallpapers_folder="$HOME/Pictures/wallpapers"

# File to store the path of the current wallpaper
current_wallpaper_file="$HOME/.cache/current_wallpaper.txt"

# Function to get the path of the current wallpaper
get_current_wallpaper() {
    [ -f "$current_wallpaper_file" ] && < "$current_wallpaper_file"
}

# Get the current wallpaper
current_wallpaper=$(get_current_wallpaper)

# Get a random wallpaper file from the folder
random_wallpaper=$(ls "$wallpapers_folder" | shuf -n 1)

# Loop until a new wallpaper is chosen
while [ "$(basename "$random_wallpaper")" = "$(basename "$current_wallpaper")" ]; do
    random_wallpaper=$(ls "$wallpapers_folder" | shuf -n 1)
done

# Set the wallpaper for each monitor using hyprpaper
for monitor in $(hyprctl monitors | awk '/Monitor/ { print $2 }'); do
    hyprctl hyprpaper preload "$wallpapers_folder/$random_wallpaper"
    hyprctl hyprpaper wallpaper "$monitor,$wallpapers_folder/$random_wallpaper"
done

# Generate color schemes using pywal
wal -nstei "$wallpapers_folder/$random_wallpaper"
# See wal --help to adjust the flags

# Copy the current wallpaper to cache for swaylock
cp -r "$wallpapers_folder/$random_wallpaper" "$HOME/.cache/swaylock_wallpaper.jpg"

# Update the file with the path of the new wallpaper
echo "$random_wallpaper" > "$current_wallpaper_file"

# Restart Waybar
pidof "waybar" > /dev/null && killall waybar
waybar &

sleep 0.2

# Create pywal colors file for hyprland
$HOME/.config/hypr/pywal_colors_hyprland.sh

# Generate discord colors using pywal-discord
#pywal-discord -t default
