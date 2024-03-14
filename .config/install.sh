#!/bin/sh

# This script installs apps for my Arch + Hyprland setup,
# feel free to delete some apps or switch them for your prefered ones,
# but some stuff in my configs may stop workng properly
#                    __  
#      _  __ __ _   / /__
#     | |/ //  ' \ /  '_/
# by  |___//_/_/_//_/\_\ 
# @vmkxyz on gitlab and github

# Basic apps
sudo pacman -Syu --needed alacritty dunst hyprland hyprpaper lf rofi swaylock python-pywal vim  waybar wlogout yay zsh zsh-autosuggestions zsh-syntax-highlighting

# Stuff needed for configs and scripts
sudo pacman -S --needed brightnessctl cliphist doas grim playerctl slurp 

# Basic apps (AUR)
yay -S --needed pywal-discord-git 
# You will probably need to install BetterDiscord and enable pywal
# in its theme settings for it to work 
# (you can probably do it in differend modded clients,
# I've only used BetterDiscord so idk)
# you can download BetterDiscord as an AppImage at https://betterdiscord.app/,
# make it executable and run it

