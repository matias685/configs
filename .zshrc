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

# Alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -l'
alias untar='tar -xzvf'
alias v='vim'
alias sv='sudo vim'
alias poweroff='sudo shutdown now'
alias sai='sudo apt install'
alias sainir='sudo apt install --no-install-recommends'
alias saud='sudo apt update'
alias saug='sudo apt upgrade'
alias sauu='sudo apt update && sudo apt upgrade'

autoload -Uz compinit
compinit
# End of lines added by compinstall
