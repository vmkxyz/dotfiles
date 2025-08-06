#!/usr/bin/env sh
# A script used by me when moving to a new workstation to safe a bit of work

# "some" packages, most of them I don't use anymore
#sudo pacman -Syu --needed alacritty alsa-utils audacity bc brightnessctl btop celluloid cliphist dash dhcpcd discord dunst eog evince exfat-utils file-roller firefox gamemode gdm gimp git github-cli gnome-calculator gnome-disk-utility gnome-software gnome-system-monitor gnome-text-editor grim grub hyprland hyprpaper iwd kdeconnect krita lf lutris man mangohud monero-gui nautilus ncdu neofetch neovim noto-fonts-cjk obs-studio opendoas otf-font-awesome playerctl python-pywal reflector rofi shellcheck signal-desktop slurp snapshot steam hypridle hyprlock syncthing telegram-desktop terminus-font timeshift tlp transmission-gtk ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-sourcecodepro-nerd ufw unrar v4l2loopback-dkms v4l2loopback-utils waybar wev wl-clipboard xdg-desktop-portal-hyprland xdg-user-dirs-gtk xwaylandvideobridge yt-dlp yubikey-manager zathura zathura-pdf-mupdf zsh zsh-autosuggestions zsh-syntax-highlighting

# to get rid of the "firmware missing" warnings when running build hooks
#sudo pacman -Syu --needed linux-firmware-qlogic linux-headers terminus-font
#paru -Syu --needed aic94xx-firmware wd719x-firmware upd72020x-fw ast-firmware

set -e # exit immediately if any command returns a non-zero exit status

pwd=$(pwd)

info() {
	printf "\n============ %s ============\n" "$1"
}

yN() {
	(
		printf "%s [y/N] " "$1"
		read -r answer

		case "$answer" in
			y|Y)
				return 0
				;;
			*)
				return 1
				;;
		esac
	)
}

system_update() {
	info "System update and base packages"
	sudo pacman -Syu --needed \
		base-devel dash brightnessctl grim slurp man vim neovim \
		noto-fonts-cjk opendoas otf-font-awesome playerctl \
		reflector ttf-sourcecodepro-nerd ufw cliphist \
		libxcrypt-compact git
}

install_paru() {
	info "Installing paru"
	git clone https://aur.archlinux.org/paru.git /tmp/paru || exit 1
	cd /tmp/paru
	makepkg -si --noconfirm
	cd "$pwd"
	rm -rf /tmp/paru
}

install_packer() {
	info "Installing packer for Neovim"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
		~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

create_dirs() {
	info "Creating user directories"
	mkdir -p ~/Downloads ~/Documents ~/Games ~/Music \
		~/Pictures/wallpapers ~/Pictures/grim \
		~/Sync ~/git ~/projects
}

setup_doas() {
	info "Replacing sudo with doas"
	if [ ! -f /etc/doas.conf ]; then
		sudo ln -fs "$(command -v doas)" /usr/bin/sudo
		printf "permit :wheel as root\npermit persist :wheel\n" | sudo tee /etc/doas.conf > /dev/null
		sudo pacman -Rdd --noconfirm sudo
	else
		echo "Existing doas.conf found, aborting sudo replacement"
		exit 1
	fi
}

blacklist_pc_speaker() {
	info "Blacklisting PC speaker DKMS module"
	echo 'blacklist pcspkr' | sudo tee /etc/modprobe.d/nobeep.conf > /dev/null
}

link_dash() {
	info "Linking /bin/sh to dash"
	sudo ln -sfT dash /usr/bin/sh
}

configure_ufw() {
	info "Configuring ufw firewall"
	sudo ufw --force enable
	sudo ufw allow 1714:1764/udp
	sudo ufw allow 1714:1764/tcp
	sudo ufw reload
}

setup_dwl() {
	info "Getting dwl ready"
	sudo pacman -S --needed wlroots0.18 wayland libinput pkgconf libxcb xorg-xwayland foot
	git clone https://codeberg.org/vmkxyz/dwl.git ~/git/dwl || exit 1
	cd ~/git/dwl
	sudo make install
	cd "$pwd"
}


system_update
install_paru
install_packer
create_dirs
setup_doas
blacklist_pc_speaker
link_dash
configure_ufw
setup_dwl

printf "\nScript finished, a reboot is recommended.\n"
if yN "Reboot now?"; then
	printf "Rebooting...\n"
	sudo reboot
else
	return 0
fi
