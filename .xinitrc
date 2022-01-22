#!/bin/sh

export PATH=$HOME/.local/bin:$PATH

$HOME/.fehbg
picom &
dunst &
udiskie -an &
unclutter &
xrdb $HOME/.Xresources
slstatus &

exec dwm
