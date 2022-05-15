autoload -U colors && colors # Load colors 
setopt autocd
unsetopt nomatch
stty stop undef

export EDITOR='vim'
export VISUAL='emacs'
export SUDO_EDITOR='vim'

# Custom prompt
#PROMPT='%~ %# '
#PROMPT='%F{111}%m:%F{2}%~ $%f '
PROMPT='%F{2}%~ $%f '
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
#	ls='ls -hpq --color=always --group-directories-first' \
#	la='ls -a --color=always --group-directories-first' \
#	ll='ls -lhpq --color=always --group-directories-first' \
#	lla='ls -lah --color=always --group-directories-first' \
#	l.='ls -a | egrep "^\."'

alias \
    	ls='exa --icons -h --color=always --group-directories-first' \
	la='exa --icons -a --color=always --group-directories-first' \
	ll='exa --icons -lh --color=always --group-directories-first' \
	lla='exa --icons -lah --color=always --group-directories-first' \
	l.='exa --icons -a | egrep "^\."'

# cd alias
alias \
       	c='cd ~/.config' \
	b='cd ~/.local/bin' \
	d='cd ~/.local/src/dwm'

# app alias
alias \
	e='$EDITOR' \
       	v='vim' \
	vim='vim' \
	nnn='nnn -Dde'

# pacman alias 
alias \
       	pacin='sudo pacman -S' \
	pacrm='sudo pacman -Rns' \
	pacup='sudo pacman -Syu' \
	pacs='pacman -Ss' \
	pacq='pacman -Q' \
	pacqi='pacman -Qi' \
	paco='pacman -Qtdq'

# Edit configs
alias \
	zshrc='vim ~/.zshrc' \
	vimrc='vim ~/.vimrc' \
	cfs='vim ~/.config/sway/config' \
	cfi3='vim ~/.config/i3/config' \
	cfb='vim ~/.config/bspwm/bspwmrc' \
	cfbar='vim ~/.config/polybar/config' \
	cfk='vim ~/.config/sxhkd/sxhkdrc'

# Set theme
alias \
	light="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'" \
	dark="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'"

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zprofile
