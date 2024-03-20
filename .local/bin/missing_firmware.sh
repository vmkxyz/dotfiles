#!/bin/sh
# run this script as root (with sudo)

pacman -Syu --needed linux-firmware-qlogic linux-headers
yay -Syu --needed aic94xx-firmware wd719x-firmware upd72020x-fw ast-firmware
