# Config for the Zoomer Shell (zsh)
#                    __
#      _  __ __ _   / /__
#     | |/ //  ' \ /  '_/
# by  |___//_/_/_//_/\_\
# @vmkxyz on gitlab and github

# Enviroment variables are in .zshenv

# set
set +o prompt_cr +o prompt_sp # disable trailing new line on launch (highlighted percent symbol)
#PROMPT_EOL_MARK='' # this changes the highlighted percent symbol to blank

# History
mkdir -p $HOME/.cache/zsh/
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Load history file
if [[ -f $HISTFILE ]]; then
    fc -R
fi

# set to -e for emacs mode or to -v for vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne '\e[4 q'
}
zle -N zle-line-init
#echo -ne '\e[4 q' # Use underline shape cursor on startup.
#preexec() { echo -ne '\e[4 q' ;} # Use underline shape cursor for each new prompt.


# Tab complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $HOME/.cache/zsh/.zcompdump
_comp_options+=(globdots)	# show hidden files
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # add colors
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # make tab complete case-insensitive
#zstyle ':completion:*' menu no # uncomment this if fzf-tab is bugging

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-foward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v bacward-delete-char

# Colors and PS1
autoload -U colors && colors
PS1="%B%F{blue}%~%f %F{green}>%f%b "

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Execute in shell
date

# Aliases
alias c='clear'
alias :q='exit'
alias e='exit'
alias d='doas'
alias n='nautilus'
alias f='firefox'

alias grep='grep --color=auto'
alias ls='exa -a --color=always --group-directories-first'
alias ll='exa -alb --color=always --group-directories-first --time-style long-iso'

alias p='doas pacman'
alias sy='doas pacman -Sy'
alias syy='doas pacman -Syy'
alias syu='doas pacman -Syu'
alias ps='doas pacman -Syu'
alias pps='doas pacman -S'
alias pss='pacman -Ss'
alias pr='doas pacman -R'
alias prns='doas pacman -Rns'
alias pq='pacman -Q'
alias pqe='pacman -Qe'
alias pqq='pacman -Qq'
alias pqeq='pacman -Qeq'
alias pqqe='pacman -Qqe'
alias cleanup="doas pacman -Syu; pacman -Qdtq | xargs -r doas pacman -Rsn --noconfirm; paru -Scc" # Run this from time to time

alias sudo='doas'
alias cd='z'

alias cfg='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME'
alias cfga='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME add'
alias cfgau='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME add -u'
alias cfgc='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME commit'
alias cfgca='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME commit -a'
alias cfgp='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME push'
alias cfgf='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME fetch'
alias cfgl='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME pull'
alias cfgs='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME status'

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
source /usr/share/zsh/plugins/zsh-timer/timer.plugin.zsh

# Hooks
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
