# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

HISTCONTROL=ignoreboth

shopt -s checkwinsize autocd cdspell dirspell histappend

export EDITOR="vim"
export VISUAL='emacs'

HISTSIZE=1000
HISTFILESIZE=2000

PATH=$PATH:$HOME/.local/bin/
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# Get repo info
if [ "$color_prompt" = yes ]; then
  PS1='\[\033[01;34m\]\w\[\033[00m\] $ '
else
  PS1='\w\ $ '
fi
unset color_prompt force_color_prompt

# Syntax color in manpages
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_so=$'\E[1;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

# Adding colors
alias \
	grep='grep --color=auto' \
	egrep='egrep --color=auto' \
	ls='ls -hpq --color=always --group-directories-first' \
	la='ls -a --color=always --group-directories-first' \
	ll='ls -lhpq --color=always --group-directories-first' \
	lla='ls -lah --color=always --group-directories-first' \
	l.='ls -a | egrep "^\."'

# color output for grep
alias grep='grep -sI --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# verbose commands
alias \
      rm='rm -v' \
      cp='cp -v' \
      mv='mv -v' \
      mkd='mkdir -pv'

# directory shortcuts
alias \
    dl='cd $HOME/Downloads' \
    conf='cd $HOME/.config'

# vim
alias \
    v='vim' \
    vimrc='vim ~/.vimrc'

# Edit configs
alias \
    bashrc='vim ~/.bashrc'

# bash completion
source /etc/profile.d/bash_completion.sh
