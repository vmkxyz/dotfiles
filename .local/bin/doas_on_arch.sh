#!/bin/sh
# this script symlinks doas to sudo so programs using sudo directly work, makes doas kinda like sudo and FORCE REMOVES SUDO! it ussually warks for however some stuff in the system might break by doing that, you've been warned
# see https://wiki.archlinux.org/title/Doas
# run this script as root

pacman -S --needed opendoas
pacman -rdd sudo # Scary!
ln -s $(which doas) /usr/bin/sudo
ln -s $(which doas) /bin/sudo
ln -s $(which doas) /sbin/sudo
if [ ! -e "/etc/doas.conf" ]; then
    touch "/etc/doas.conf"
fi
echo 'permit :wheel as root
permit persist :wheel' >> /etc/doas.conf
