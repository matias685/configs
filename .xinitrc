#!/bin/sh

export PATH=$HOME/.local/bin:$PATH

$HOME/.fehbg
picom &
dunst &
udiskie -an &
slstatus
unclutter
xrdb $HOME/.Xresources

exec dwm
