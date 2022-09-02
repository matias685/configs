autoload -U colors && colors # Load colors 
setopt autocd
unsetopt nomatch
stty stop undef

export EDITOR='nvim'
export VISUAL='emacs'
export SUDO_EDITOR='nvim'
export PATH=$HOME/.local/bin:$PATH

# Custom prompt
PROMPT='%~ λ '
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

# Syntax color in manpages
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_so=$'\E[1;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

# ALIASES

# Adding verbosity
alias \
    cp='cp -v' \
	rm='rm -v' \
	mv='mv -v' \
	mkd='mkdir -pv'

# Adding colors
alias \
	grep='grep --color=auto' \
	egrep='egrep --color=auto' \
	ls='ls -hpq --color=always --group-directories-first' \
	la='ls -a --color=always --group-directories-first' \
	ll='ls -lhpq --color=always --group-directories-first' \
	lla='ls -lah --color=always --group-directories-first' \
	l.='ls -a | egrep "^\."'

# sudo alias
alias sudo='sudo '

# cd alias
alias \
   	c='cd ~/.config' \
	b='cd ~/.local/bin'

# app alias
alias \
    e='$EDITOR' \
    v='nvim' \
    vim='nvim' \
    nnn='nnn -Dde' \
    yt='yt-dlp --embed-metadata -i' \
    yta='yt-dlp --embed-metadata -i -x -f bestaudio/best'

# Edit configs
alias \
	zshrc='nvim ~/.zshrc' \
	vimrc='nvim ~/.config/nvim/init.vim' \

# Set theme
alias \
	light="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'" \
	dark="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'"

source $HOME/.zprofile 
