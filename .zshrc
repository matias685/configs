autoload -U colors && colors # Load colors 
setopt autocd
stty stop undef

export EDITOR='vim'

# Custom prompt
PROMPT='%F{blue}%1~%f %# '

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history 

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)     # Include hidden files.

# ALIASES

# Adding verbosity
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias mkd='mkdir -pv'

# Adding colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# ls commands
alias lsl='ls -nph'
alias lsla='ls -Anph'
alias lsa='ls -A'
alias ls.='ls -A | egrep "^\."'

# These commands are too long!
alias g='git'
alias nnn='nnn -Dde'
alias e='$EDITOR'
alias v='$EDITOR'
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'

# xbps
alias xin='doas xbps-install -S'
alias xrm='doas xbps-remove -R'
alias xup='doas xbps-install -Su'
alias xq='xbps-query -Rs'
alias pkgi='xbps-query -S'
alias pkgs='xbps-query -l | wc -l'
alias lspkg='xbps-query -l'

alias doas='doas '

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
