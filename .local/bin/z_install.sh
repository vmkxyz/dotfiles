#!/usr/bin/env sh
# a script only really useful to me, I might use this in case of moving to a new deivce to save me some work

# initial pacman
echo "============= Installing a bunch of packages ============="
sudo pacman -Syu --needed base-devel dash brightnessctl grim slurp man vim neovim noto-fonts-cjk opendoas otf-font-awesome playerctl reflector ttf-sourcecodepro-nerd ufw cliphist libxcrypt-compact

# paru
echo "============= Compiling paru ============="
git clone https://aur.archlinux.org/paru.git
cd paru || exit 1
makepkg -si
cd ..
rm -rf paru

# "some" packages, most of them I don't use anymore
#sudo pacman -Syu --needed alacritty alsa-utils audacity bc brightnessctl btop celluloid cliphist dash dhcpcd discord dunst eog evince exfat-utils file-roller firefox gamemode gdm gimp git github-cli gnome-calculator gnome-disk-utility gnome-software gnome-system-monitor gnome-text-editor grim grub hyprland hyprpaper iwd kdeconnect krita lf lutris man mangohud monero-gui nautilus ncdu neofetch neovim noto-fonts-cjk obs-studio opendoas otf-font-awesome playerctl python-pywal reflector rofi shellcheck signal-desktop slurp snapshot steam hypridle hyprlock syncthing telegram-desktop terminus-font timeshift tlp transmission-gtk ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-sourcecodepro-nerd ufw unrar v4l2loopback-dkms v4l2loopback-utils waybar wev wl-clipboard xdg-desktop-portal-hyprland xdg-user-dirs-gtk xwaylandvideobridge yt-dlp yubikey-manager zathura zathura-pdf-mupdf zsh zsh-autosuggestions zsh-syntax-highlighting

# to get rid of the "firmware missing" warnings when running build hooks
#sudo pacman -Syu --needed linux-firmware-qlogic linux-headers terminus-font
#paru -Syu --needed aic94xx-firmware wd719x-firmware upd72020x-fw ast-firmware

# packer nvim
echo "============= Install packer for neovim ============="
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# dirs
echo "============= Make some directories ============="
cd ~ || exit 1
mkdir -p Downloads Documents Games Music Pictures/wallpapers Pictures/grim Sync git Projects

# doas
echo "============= Setup doas and remove sudo ============="
sudo ln -fs "$(which doas)" /usr/bin/sudo
if [ ! -e "/etc/doas.conf" ]; then
	sudo touch "/etc/doas.conf"
	printf "permit :wheel as root\npermit persist :wheel" | sudo tee -a /etc/doas.conf
	sudo pacman -Rdd sudo && echo "sudo removed successfully"
else
	[ ! -f /etc/doas.conf ] || echo "existing configuration for doas aready, aborting..." && exit 1
fi

# pc speaker
echo "============= Disable pc speaker via modprobe unloading ============="
printf 'blacklist pcspkr' | sudo tee -a /etc/modprobe.d/nobeep.conf

# dash
echo "============= Link /bin/sh to dash ============="
ln -sfT dash /usr/bin/sh

# ufw
echo "============= enable ufw and allow some ports ============="
sudo ufw enable
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload ufw
