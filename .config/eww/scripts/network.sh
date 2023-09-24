#!/usr/bin/bash


# Return icon corresponding to which network type is used
GetNetworkIcon () {

    if [ $(cat /sys/class/net/enp*/operstate) = up ]
    then
        echo 
    elif [ $(cat /sys/class/net/w*/operstate) = up ]
    then

        # Get the signal strength
        wifi_signal=$(GetConnectedWifiSignal)

        # Select wifi icon based on signal strength
        if [ $wifi_signal -eq 0 ] 
        then 
            echo 󰤯
        elif [ $wifi_signal -le 25]
        then
            echo 󰤟
        elif [ $wifi_signal -le 50 ]
        then
            echo 󰤢
        elif [ $wifi_signal -le 75 ]
        then
            echo 󰤥
        else
            echo 󰤨
        fi

    elif [ $(cat /sys/class/net/enp*/operstate) = down ]
    then
        echo 
    elif [ $(cat /sys/class/net/w*/operstate) = down ]
    then
        echo 󰤭
    fi
}

# Get the current connectivity, can be none, portal, limited, full or unknown
GetConnectivity () {
    echo "$(nmcli network connectivity)"
}

# Get the status of wifi, i.e. enable or disabled 
GetWifiStatus () {
    echo "$(nmcli radio wifi)"
}

# Get the name of the connected wifi network 
GetConnectedWifiNetwork () {
    echo "$(nmcli -t connection show --active | grep wifi | cut -d: -f1)"
}

# Create an eww box containing two parts. One part is a button with information 
# of the connected wifi network, which can be disconnect on click. The second 
# part is a scroll containing buttons of wifi networks in range sorted based on 
# their signal strength. To connect to a wifi newtork one of those buttons is pressed.
GetWifiNetworks () {
   
    # The two parts are sperated by a label,
    # so two variables are used
    eww_discoverd_networks_string=""
    eww_connected_network_string=""

    # Scan for wifi networks an iterate over each network found
    while read network
    do 
        # Split $network using ':' as the delimiter in separate variables 
        # for each information field.
        IFS=: read inuse ssid signal security chan <<< $network
        
        # Select signal icon based on the signal strength
        if [ $signal -le  25 ]
        then
            signalIcon=󰢿
        elif [ $signal -le 50 ]
        then
            signalIcon=󰢼
        elif [ $signal -le 75 ]
        then
            signalIcon=󰢽
        else
            signalIcon=󰢾
        fi

        # Display the netwok ssid with its signal strength, security type and channel number
        eww_string=" 
                (box 
                  :orientation 'vertical'
                  (label :class 'nameLabel' :text '${ssid}')
                  (box 
                    :style 'margin-top: 5px'
                    :orientation 'horizontal'
                    :space-evenly false
                    (label :class 'infoLabel' :hexpand true :halign 'start' :text '${signalIcon} ${signal}')
                    (label :class 'infoLabel' :hexpand true :halign 'center' :text '󰒃 ${security}')
                    (label :class 'infoLabel' :hexpand true :halign 'end' :text 'Chan ${chan}')
                  )
                )
        "

        # If $inuse is '*' the created button is the connected wifi network.
        # Else, a wifi network is in range an can be connected to.
        if [[ "$inuse" == "*" ]]
        then
            eww_connected_network_string="
            (button 
                :class 'connectedItemBtn' 
                :timeout '10s'
                :onclick 'nmcli con down ${ssid} && ./scripts/network.sh updateWifiVars'
                ${eww_string}
            )
            "
        else
            eww_discoverd_networks_string+="
            (button 
                :class 'itemBtn' 
                :timeout '10s'
                :onclick 'nmcli con up ${ssid} && ./scripts/network.sh updateWifiVars'
                ${eww_string}
            )
            "
        fi

    # Pass the output of nmcli to the while read loop. Only select (-f)
    # the in-use, ssiid, signal, security and chan fields and compress output (-t)
    done < <(nmcli -t -f in-use,ssid,signal,security,chan dev wifi)
    

    # Return an eww string
    echo "
    (box 
        :orientation 'vertical'
        :vexpand true 
        :space-evenly false 

        (label 
            :class 'separatorLabel'
            :text 'Connected'
        )
        ${eww_connected_network_string}

        (label 
            :class 'separatorLabel'
            :text 'Discovered'
        )

        (scroll
            :vexpand true
            (box
                :orientation 'vertical'
                :space-evenly false 
                :vexpand true 
                ${eww_discoverd_networks_string}
            )
        )
    )"

}

# Get the signal strength of the connected wifi network,
# which is indicated with a '*' in the output of 'nmcli dev wifi'
GetConnectedWifiSignal () {
    echo "$(nmcli -t dev wifi | grep "*" | cut -d: -f12)"
}

# Turn wifi On or Off
toggleWifi () {
    
    if [[ $(GetWifiStatus) == 'enabled' ]]
    then
        nmcli radio wifi off 
    else
        nmcli radio wifi on 
    fi
}

# Update discoverd wifi networks and current network information
updateWifiVars () {
    eww update wifiNetworks="$(GetWifiNetworks)"
}



"$@"

























