#!/usr/bin/bash

# Get the ID of the active workspace
active_workspace=$(hyprctl activeworkspace -j | jq ".id")

# Create a string of eww buttons, one for each of the nine workspaces
workspaces_eww_buttons=""
for i in {1..9}
do
    # Set the workspace symbol to a solid circle if it is the active one,
    # else set it to an open circle.
    if [[ $i == $active_workspace ]]; then
        workspace_symbol=""
    else
        workspace_symbol=""
    fi

    # Append an eww button with the current workspace symbol and add an 
    # onclick event to change to this workspace
    workspaces_eww_buttons+="
        (button 
            :class \"workspaceBtn\"
            :onclick \"hyprctl dispatch workspace $i\"	
            \"$workspace_symbol\"
        )
    "
done 

# Output an eww box with the workspace buttons
echo "(box	
    :spacing \"-1\" 
    :orientation \"h\" 
    :halign \"start\" 
    :space-evenly \"false\" 
    $workspaces_eww_buttons
)"


