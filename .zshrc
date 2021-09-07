autoload -U colors && colors # Load colors 
setopt autocd
unsetopt nomatch
stty stop undef

export EDITOR='vim'

# Custom prompt
zstyle ':vcs_info:git:*' formats ' 🐙 %b '
PROMPT='[%F{magenta}%n%F{yellow}🚀%F{cyan}%M %F{white}%~%B%f%b]%F{green}$ '

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
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# ls commands
#alias lsl='ls -nph'
#alias lsla='ls -Anph'
#alias lsa='ls -A'
#alias ls.='ls -A | egrep "^\."'

alias ls='exa -alh --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

alias c='cd ~/.config'
alias b='cd ~/.local/bin'
alias d='cd ~/.local/src/dwm'

# pacman 
alias pacin='doas pacman -S'
alias pacrm='doas pacman -Rns'
alias pacup='doas pacman -Syu'
alias pacs='pacman -Ss'
alias pacq='pacman -Q'
alias pacqi='pacman -Qi'
alias paco='pacman -Qtdq'

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
