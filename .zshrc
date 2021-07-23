# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matias/.zshrc'

# Prompt
PROMPT='%F{blue}%1~%f %# '

# Autocomplete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Aliases
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacq='pacman -Q'
alias pacqi='pacman -Qi'
alias pacup='sudo pacman -Syu'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias untar='tar -xzvf'
alias ..='cd ..'
alias ...='cd ../..'
alias v='nvim'
alias sv='sudo nvim'

autoload -Uz compinit
compinit
# End of lines added by compinstall
