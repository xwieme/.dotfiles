# Check how many packages require updates.
# Assign a color based on the number.

num_updates=$((checkupdates;pacman -Qm) | wc -l)

# Set color threshholds
green_threshhold=0
yellow_threshhold=25
red_threshhold=100

# Output json string for waybar
if [ "$num_updates" -gt "$red_threshhold" ]; then
    css_class="red"

elif [ "$num_updates" -gt "$yellow_threshhold" ]; then
    css_class="yellow"

else
    css_class="green"

fi

printf '{"text": "%s", "alt": "%s", "tooltip": "", "class": "%s"}' "$num_updates" "$num_updates" "$css_class"
