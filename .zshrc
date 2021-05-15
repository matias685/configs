# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matias/.zshrc'

autoload -Uz compinit
compinit
# Autocomplete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# End of lines added by compinstall


# Aliases
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacq='pacman -Q'
alias pacqi='pacman -Qi'
alias pacup='sudo pacman -Syu'
alias v='nvim'
alias sv='sudo nvim'
alias ls='lsd'
alias ll='lsd -lah'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias untar='tar -xzvf'
alias x='startx'
alias ..='cd ..'
alias ...='cd ../..'

# Starship prompt
eval "$(starship init zsh)"

source /home/matias/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
