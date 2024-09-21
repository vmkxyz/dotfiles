[ "$(tty)" = "/dev/tty1" ] && Hyprland && export QT_QPA_PLATFORM=wayland
[ "$(tty)" = "/dev/tty2" ] && startx
[ "$(tty)" = "/dev/tty3" ] && export QT_QPA_PLATFORM=wayland XDG_CURRENT_DESKTOP=dwl && slstatus -s | dwl
