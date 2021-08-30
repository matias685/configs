# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

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

# ls aliases
alias ls='ls --quoting-style=literal -pq --time-style=iso --color=auto --group-directories-first --show-control-chars'
alias lsl='ls -nph'
alias lsla='ls -Anph'
alias lsa='ls -A'
alias ls.='ls -A | egrep "^\."'

# color output for grep
alias grep='grep -sI --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

alias dl='cd "$HOME"/Downloads'

#cd command
alias ..='cd ..'

# xbps
alias xin='doas xbps-install -S'
alias xrm='doas xbps-remove -R'
alias xup='doas xbps-install -Su'
alias xq='xbps-query -Rs'
alias pkgs='xbps-query -l | wc -l'

# poweroff and reboot
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'

# vim
alias sudoedit='doas vim'
alias v='vim'

alias moc='mocp'
