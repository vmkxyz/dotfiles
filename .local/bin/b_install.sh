#!/bin/sh
# this script is mainly for me when moving to a different computer, it installs a lot of apps I like and use

sudo pacman -Syu --needed alacritty alsa-utils audacity bc brightnessctl btop celluloid cliphist dash dhcpcd discord dunst eog evince exfat-utils file-roller firefox gamemode gdm gimp git github-cli gnome-calculator gnome-disk-utility gnome-software gnome-system-monitor gnome-text-editor grim grub hyprland hyprpaper iwd kdeconnect krita lf lutris man mangohud monero-gui nautilus ncdu neofetch neovim noto-fonts-cjk obs-studio opendoas otf-font-awesome playerctl python-pywal reflector rofi shellcheck signal-desktop slurp snapshot steam swayidle swaylock syncthing telegram-desktop terminus-font timeshift tlp transmission-gtk trizen ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-sourcecodepro-nerd ufw unrar v4l2loopback-dkms v4l2loopback-utils waybar wev wl-clipboard xdg-desktop-portal-hyprland xdg-user-dirs-gtk xwaylandvideobridge yay yt-dlp yubikey-manager zathura zathura-pdf-mupdf zsh zsh-autosuggestions zsh-syntax-highlighting || echo 'error: pacman failed'

yay -S --needed pfetch steamcmd trizen wlogout xclicker pywal-discord-git || echo 'error: yay failed'
