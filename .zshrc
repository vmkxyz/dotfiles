# Config for the Zoomer Shell (zsh)
#                    __
#      _  __ __ _   / /__
#     | |/ //  ' \ /  '_/
# by  |___//_/_/_//_/\_\
# @vmkxyz on gitlab and github

# Import colorscheme from 'wal'
(cat ~/.cache/wal/sequences &)

# Export enviroment variables
export EDITOR='nvim'
alias v=$EDITOR

# History in cache
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# I don't even know what does this stuff do...
bindkey -e
zstyle :compinstall filename '/home/vmk/.zshrc'

# History auto/tab complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	# show hidden files

# Use vim keys in tab complete menu
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-foward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v bacward-delete-char

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

# Aliases
alias c='clear'
alias cls='clear'
alias :q='exit'
alias e='exit'

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias lla='ls -Al --color=auto'

alias p='doas pacman'
alias sy='doas pacman -Sy'
alias syu='doas pacman -Syu'
alias psy='doas pacman -Syu'
alias psyu='doas pacman -Syu'
alias ps='doas pacman -S'
alias pss='pacman -Ss'
alias pr='doas pacman -R'
alias pq='pacman -Q'
alias pqe='pacman -Qe'
alias pqeq='pacman -Qeq'
alias pqqe='pacman -Qqe'
alias cleanup='doas pacman -Syu && doas pacman -Rsn $(pacman -Qdtq) && yay -Scc && yay -Yc'

alias nf='neofetch'
alias pf='pfetch'
alias uf='uwufetch'

alias sudo='doas'

alias ks='killall steam'
alias cfg='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

eval $(thefuck --alias)

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
