#!/bin/bash

echo "
====================================================================================
   arch script to install basic tools, applications and a DE or a WM, made by vmk
====================================================================================

"

# asks to install basic gaming apps and tools
echo "Do you want to install gaming software? y/n?"
read GAME

# asks to install League of Legends
if
	[ "$GAME" = y ]
then
	echo "Do you want to install League of Legends? y/n?"
	read LOL
fi

#asks wich DE or WM to install
echo "Wich DE or WM do you want? (select number or leave blank for none)
1: gnome
2: qtile"

read DE

# installs reflector and configures mirrors
sudo pacman -Sy --needed reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# installs basic tools and aplications
sudo pacman -Sy --needed vim btop zsh git ufw timeshift neofetch bc mc base-devel ncdu
sudo pacman -Syu

# sets zsh as the default shell
chsh -s $(which zsh) & sudo chsh -s $(which zsh)

# installs yay
git clone https://aur.archlinux.org/yay.git
makepkg -si ~/yay

# installs tools and applications from the AUR
yay -S trizen

# installs GNOME and basic gui applications and enables some services
if
	[ "$DE" -eq 1 ]
then
	sudo pacman -S --needed gnome-backgrounds evince gdm gnome-backgrounds gnome-calculator gnome-calendar gnome-clocks gnome-contol-center gnome-logs gnome-menus gnome-remote-desktop gnome session gnome-session-daemon gnome-shell gnome-shell-extensions gnome-software gnome-system-monitor gnome-text-editor gnome-user-docs gnome-user-share gnome-weather grilo-plugins gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb loupe malcontent orca rygel snapshot sushi tecla totem tracker3-miners xdg-desktop-portal-gnome xdg-user-dirs-gtk yelp nautilus alacritty firefox gparted discord espanso-wayland espanso-gui

	sudo pacman -Syu
	sudo systemctl enable gdm
fi

# installs qtile and basic gui applications and enables some serices
if
	[ "$DE" -eq 2 ]
then
       sudo pacman -S --needed qtile gdm python-dbus-next swaybg nautilus alacritty firefox gparted discord espanso espanso-wayland espanso-gui

       sudo pacman -Syu 
       sudo systemctl enable gdm

fi

# installs basic gaming applications and toolsif
if
	[ "$GAME" = y ]
then
	sudo pacman -S steam mangohud && yay -S heroic-games-louncher bottles protonplus
fi

# installs League of Legends from the AUR using trizen
# (because yay doesnt work half the time...)
if
	[ "$LOL" = y ]
then
	trizen -S leagueoflegends-git
fi
