#!/bin/sh
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
syncthing serve --no-browser &
kdeconnect-indicator &
rnd_wall_shell_wbg &
hypridle &
lowbat &
dunst &
