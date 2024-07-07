#!/usr/bin/bash


# Get addresses of all open windows
windowAddresses=$(hyprctl clients -j | jq ".[] | .address" | tr -d '"')

# Iterate through the window addresses and create a batch hyprctl command to addjust the window opacity
cmd=""
for windowAddress in $windowAddresses 
do
    cmd+="setprop address:${windowAddress} alpha $1; setprop address:${windowAddress} alphainactive $1;"
done

# Apply the window opacity
echo "$cmd"
hyprctl --batch $cmd

