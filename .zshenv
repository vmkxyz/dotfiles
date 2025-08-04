# Paths
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"
export PATH=$HOME/.local/share/cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH

# zsh plugin config
## timer
export TIMER_FORMAT="%d"
export TIMER_PRECISION=2
## zsh vi mode
export ZVM_VI_HIGHLIGHT_FOREGROUND=#cdd6f4
export ZVM_VI_HIGHLIGHT_BACKGROUND=#414356
function zvm_config() {
	ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
	ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# Default programs
export TERMINAL="foot"
export TERMINAL_PROG="foot"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

# default dirs
## XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DESKTOP_DIR="$HOME/.local/share/applications/"
# other
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export SCREENDIR="${XDG_RUNTIME_DIR}/screen"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # might break DMs, xwayland
export OLLAMA_MODELS="$XDG_DATA_HOME/ollama/models"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ADB_VENDOR_KEYS="$XDG_DATA_HOME/.android" # might not work
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME/renpy"

# Themes
export QT_QPA_PLATFORMTHEME="qt5ct"
export MANPAGER="nvim +Man!"
