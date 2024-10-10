[ "$(tty)" = "/dev/tty1" ] && start-dwl
[ "$(tty)" = "/dev/tty2" ] && startx
[ "$(tty)" = "/dev/tty3" ] && Hyprland && export QT_QPA_PLATFORM=wayland
