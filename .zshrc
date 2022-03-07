autoload -U colors && colors # Load colors 
setopt autocd
unsetopt nomatch
stty stop undef

export EDITOR='vim'

# Custom prompt
#PROMPT='[%F{white}%~%B%f%b] $ '
#PROMPT='%~ %# '
PROMPT='%# '
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
       	pacin='doas pacman -S' \
	pacrm='doas pacman -Rns' \
	pacup='doas pacman -Syu' \
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
