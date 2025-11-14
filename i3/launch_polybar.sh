#!/usr/bin/bash

# Remove all current polybars
killall polybar

sleep 1

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload top &
    done
else
    polybar --reload example &
fi
