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
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls.='ls -A | egrep "^\."'

# color output for grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#cd command
alias ..='cd ..'

# xbps
alias xin='sudo xbps-install -S'
alias xrm='sudo xbps-remove -R'
alias xup='sudo xbps-install -Su'
alias xq='xbps-query -Rs'
alias pkgs='xbps-query -l | wc -l'

# poweroff and reboot
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'

# vim
alias sv='sudo nvim'
alias v='nvim'

alias moc='mocp'

bind 'set colored-stats on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'
