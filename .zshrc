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
# End of lines added by compinstall


# Aliases
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rns'
alias pacup='sudo pacman -Syu'
alias v='vim'
alias sv='sudo vim'
alias ls='lsd'
alias ll='lsd -lah'
alias cp='cp -i'
alias rm='rm-i'
alias mv='mv -i'
alias grep='grep --color=auto'

# Starship prompt
eval "$(starship init zsh)"

