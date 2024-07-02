#!/bin/sh
# RUN AS ROOT

pacman -Syu --needed linux-firmware-qlogic linux-headers terminus-font
paru -Syu --needed aic94xx-firmware wd719x-firmware upd72020x-fw ast-firmware
