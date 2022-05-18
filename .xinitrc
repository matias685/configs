#!/bin/sh

# source .profile on startup
if [ -r ~/.profile ]; then . ~/.profile; fi

# set blank time
xset s 1800 1800

# startup programs
xrdb $HOME/.Xresources
setbg
picom &
redshift &
dunst &
lxpolkit &
udiskie -an &
xsettingsd &
clipmenud &
#unclutter &

# window manager
slstatus &
exec dbus-launch --sh-syntax --exit-with-session dwm
