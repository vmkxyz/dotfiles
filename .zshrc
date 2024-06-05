# Config for the Zoomer Shell (zsh)
#                    __
#      _  __ __ _   / /__
#     | |/ //  ' \ /  '_/
# by  |___//_/_/_//_/\_\
# @vmkxyz on gitlab and github

# Import colorscheme from pywal
#(cat ~/.cache/wal/sequences &)

# Export enviroment variables
export EDITOR='nvim'
alias v=$EDITOR

# some variables
export PATH=$PATH:~/.local/bin/
export TERMINAL=alacritty
set +o prompt_cr +o prompt_sp # disable trailing new line on launch (highlighted percent symbol)
#PROMPT_EOL_MARK='' # this changes the highlighted percent symbol to blank

# History
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
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

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
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias lla='ls -Al --color=auto'

alias p='doas pacman'
alias sy='doas pacman -Sy'
alias syy='doas pacman -Syy'
alias syu='doas pacman -Syu'
alias ps='doas pacman -Syu'
alias pps='doas pacman -S'
alias pss='pacman -Ss'
alias pr='doas pacman -R'
alias pq='pacman -Q'
alias pqe='pacman -Qe'
alias pqq='pacman -Qq'
alias pqeq='pacman -Qeq'
alias pqqe='pacman -Qqe'
alias cleanup='doas pacman -Syu && doas pacman -Rsn $(pacman -Qdtq) & paru -Scc' # Run this from time to time

alias sudo='doas'
alias cd='z'

alias cfg='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cfga='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add'
alias cfgau='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add -u'
alias cfgc='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m'
alias cfgca='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -a'
alias cfgp='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push'
alias cfgf='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME fetch'
alias cfgl='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME pull'
alias cfgs='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME status'

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh

# Hooks
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
