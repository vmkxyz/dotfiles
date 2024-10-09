[ "$(tty)" = "/dev/tty1" ] && start-dwl && export QT_QPA_PLATFORM=wayland
[ "$(tty)" = "/dev/tty2" ] && startx
[ "$(tty)" = "/dev/tty3" ] && Hyprland && export QT_QPA_PLATFORM=wayland
