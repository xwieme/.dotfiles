#!/usr/bin/bash

# Get name of the active external monitor
second_monitor=$(xrandr | grep "\sconnected" | sed 1d | awk '{print $1}')

echo $second_monitor

if [ -z "$second_monitor" ] 
then

    xrandr | grep disconnected | awk '{print $1}' | while read monitor; do
        xrandr --output $monitor --off
    done

else

    # Set the external display to the right of the internal display (eDP-1) only if
    # there is a second monitor
    xrandr --output $second_monitor --auto --right-of eDP-1

    # Assign to each monitor a polybar
    killall polybar
    bash ~/.config/i3/launch_polybar.sh

fi




