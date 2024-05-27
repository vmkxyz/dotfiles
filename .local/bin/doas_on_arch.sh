#!/bin/sh
# this script symlinks doas to sudo so programs using sudo directly work, makes doas kinda like sudo and FORCE REMOVES SUDO! it ussually warks for however some stuff in the system might break by doing that, you've been warned
# see https://wiki.archlinux.org/title/Doas
# RUN AS ROOT
# WARNING: FORCE REMOVES SUDO!

pacman -Syu --needed opendoas
pacman -Rddns sudo # Scary!
ln -s $(which doas) /usr/bin/sudo
[ ! -e "/etc/doas.conf" ] && touch "/etc/doas.conf"
echo 'permit :wheel as root\npermit persist :wheel' >> /etc/doas.conf
