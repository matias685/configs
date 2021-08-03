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

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Tab autocomplete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'


### ALIASES ###

# Basic commands
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'

# Pacman commands
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacq='pacman -Q'
alias pacqi='pacman -Qi'

