#!/bin/sh

# source .profile on startup
if [ -r ~/.profile ]; then . ~/.profile; fi

# set blank time
xset s 1800 1800

# startup programs
xrdb $HOME/.Xresources
setbg
picom &
dunst &
lxpolkit &
xsettingsd &
clipmenud &

# window manager
slstatus &
exec dwm
