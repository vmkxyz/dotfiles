#! /bin/sh
# script useful for setting up a new desktop, moving to a different one or making sure my dotfiles work properly

# Function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Check if paru is installed
if command_exists paru; then
	aur_helper="paru"
else
	echo "paru is not installed."
	read -p "Enter the AUR helper you want to use (leave blank to install paru): " user_input

	if [ -z "$user_input" ]; then
		# Ensure base-devel is installed
		echo "Updating system and installing base-devel..."
		sudo pacman -Syu --needed base-devel && updated=true

		# Install paru from GitHub
		echo "Installing paru from GitHub..."
		git clone https://aur.archlinux.org/paru.git
		cd paru || exit 1
		makepkg -si
		cd ..
		rm -rf paru
		aur_helper="paru"
	else
		# Check if the provided AUR helper is installed
		if command_exists "$user_input"; then
			aur_helper="$user_input"
		else
			echo "$user_input is not installed. Please install it and run the script again."
			exit 1
		fi
	fi
fi

# Output the selected AUR helper
echo "AUR helper set to: $aur_helper"

[ "$updated" != true ] && echo "Updating system..." && sudo pacman -Syu

# Stuff needed for configs and scripts
sudo pacman -S --needed brightnessctl cliphist doas grim playerctl slurp








sudo pacman -Syu --needed alacritty alsa-utils audacity bc brightnessctl btop celluloid cliphist dash dhcpcd discord dunst eog evince exfat-utils file-roller firefox gamemode gdm gimp git github-cli gnome-calculator gnome-disk-utility gnome-software gnome-system-monitor gnome-text-editor grim grub hyprland hyprpaper iwd kdeconnect krita lf lutris man mangohud monero-gui nautilus ncdu neofetch neovim noto-fonts-cjk obs-studio opendoas otf-font-awesome playerctl python-pywal reflector rofi shellcheck signal-desktop slurp snapshot steam swayidle swaylock syncthing telegram-desktop terminus-font timeshift tlp transmission-gtk ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-sourcecodepro-nerd ufw unrar v4l2loopback-dkms v4l2loopback-utils waybar wev wl-clipboard xdg-desktop-portal-hyprland xdg-user-dirs-gtk xwaylandvideobridge yt-dlp yubikey-manager zathura zathura-pdf-mupdf zsh zsh-autosuggestions zsh-syntax-highlighting

aur_helper -S --needed pfetch steamcmd trizen wlogout xclicker pywal-discord-git



# Basic apps
sudo pacman -Syu --needed alacritty dunst hyprland hyprpaper lf rofi swaylock python-pywal vim  waybar wlogout zsh zsh-autosuggestions zsh-syntax-highlighting


# Basic apps (AUR)
aur_helper -S --needed pywal-discord-git
# you can download BetterDiscord as an AppImage at https://betterdiscord.app/
# make it executable and run it


#! /bin/sh
sudo pacman -Syu --needed xdg-desktop-portal-gtk



















# Better-Discord installation

# Function to prompt for yes/no input
prompt_yes_no() {
    while true; do
        read -p "$1 [y/N]: " yn
        # Default to "no" if the user just presses Enter
        case $yn in
            [Yy]* ) return 0;;  # Return 0 for yes
            [Nn]* ) return 1;;  # Return 1 for no
            "" ) return 1;;     # Return 1 for empty input (default to no)
            * ) echo "Please answer yes or no.";;
        esac
    done
}

prompt_1_2() {
    while true; do
		echo "$1"
		read -p "Enter a number (default=1): " number
        case $number in
            1 ) return 0;;
            2 ) return 1;;
			"" ) return 0;;
            * ) echo "Enter a number (default=1): ";;
        esac
    done
}

# Ask if the user wants to install BetterDiscord
if prompt_yes_no "Do you want to install BetterDiscord?"; then
    # Ask if they want to compile from source or use precompiled AppImage
	if prompt_1_2 "Do you want to use a precompiled AppImage (1) or compile BetterDiscord from source (2)?"; then
		cd ~ && curl -LO https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Linux.AppImage || exit 1
		echo "The AppImage is in your home directory, run \"chmod +x BetterDiscord-Linux.AppImage\" to make it executable."
    else
		# Ask if they want to use AppImage or Linux binary after compilation
		#if prompt_1_2 "After compilation, do you want to use the AppImage (1) or the Linux binary (2)?"; then
			pacman -S --needed git yarn
			git clone https://github.com/BetterDiscord/installer || exit 1
			cd installer && yarn install
			yarn dist
			mv dist/BetterDiscord-Linux.AppImage ~/
			echo "The AppImage is in your home directory, run \"chmod +x BetterDiscord-Linux.AppImage\" to make it executable."
        #else
		#	pacman -S --needed git yarn
		#	git clone https://github.com/BetterDiscord/installer || exit 1
		#	cd installer && yarn install
		#	yarn dist
		#	mv dist/linux-unpacked/ ~/

        #fi
    fi
fi
