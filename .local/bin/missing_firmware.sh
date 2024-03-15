#!/bin/sh

pacman -Syu --needed linux-firmware-qlogic linux-headers
yay -Syu --needed aic94xx wd719x upd72020x-fw ast-firmware
