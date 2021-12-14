#!/bin/sh

# Terminate already running bar instances
pkill polybar

# Wait until all processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar 
polybar bar &
