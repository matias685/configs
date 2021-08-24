#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='[\u@\h \W]\$ '
#eval "$(starship init bash)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
      xterm-color) color_prompt=yes;;
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



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      
      if command -v exa &> /dev/null; then
        alias ls="exa --group-directories-first"
      else
        alias ls="ls -hN --color=auto --group-directories-first"
      fi

      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
      alias diff="diff --color=auto"
      alias ccat="highlight --out-format=ansi"
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## ALIASES ##

# basic commands
alias ls.='ls -A | egrep "^\."'
alias ..='cd ..'

# vim commands
alias v='vim'
alias sv='sudo vim'

# pacman commands
alias pmu='sudo pacman -Syu'
alias pmi='sudo pacman -S'
alias pmr='sudo pacman -Rns'
alias pmq='pacman -Q'
alias pmqi='pacman -Qi'
# paru
alias p='paru -Sua'
alias pi='paru -S'
alias pr='paru -Rns'

bind 'set colored-stats on'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'
