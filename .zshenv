# Paths
export PATH=$PATH:~/.local/bin/
export PATH=$HOME/.local/bin/platform-tools:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

# zsh plugin config
## timer
export TIMER_FORMAT='%d'
export TIMER_PRECISION=2

# Default apps
export TERMINAL='alacritty'
export EDITOR='nvim' # dont set to 'v' if using my dotfiles
export VISUAL='nvim'
export IMAGE_VIEWER='qimgv'
export VIDEO_PLAYER='mpv'
export AUDIO_PLAYER='mpv --audio-display-no'
export MUSIC_PLAYER='mpv --audio-display-no'
export DOCUMENT_VIEWER='zathura'
export DOCUMENT_EDITOR='libreoffice'
export AUDIO_EDITOR='audacity'
export BROWSER='firefox'
export FILE_MANAGER='yazi'
export MAIL_CLIENT='neomutt'

# Else
export QT_QPA_PLATFORMTHEME='qt5ct'
#export QT_QPA_PLATFORM=wayland
