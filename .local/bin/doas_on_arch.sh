#!/bin/sh
# this script symlinks doas to sudo so programs using sudo directly work, makes doas kinda like sudo and FORCE REMOVES SUDO!
# see https://wiki.archlinux.org/title/Doas
# aslo maybe dont run this if youve already configure doas

sudo pacman -Syu --needed opendoas
ln -s $(which doas) /usr/bin/sudo
[ ! -e "/etc/doas.conf" ] && touch "/etc/doas.conf"
echo 'permit :wheel as root\npermit persist :wheel' >> /etc/doas.conf
sudo pacman -Rddns sudo
