#!/usr/bin/bash


# Return icon corresponding to which network type is used
GetNetworkIcon () {


    if [ $(cat /sys/class/net/enp*/operstate) = up ]
    then
        echo 
    elif [ $(cat /sys/class/net/w*/operstate) = up ]
    then
        echo 󰤨
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
    echo "$(nmcli connection show --active | grep wifi | cut -d ' ' -f1)"
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


"$@"
