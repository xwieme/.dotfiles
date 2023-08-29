#!/usr/bin/bash 


GetBluetoothStatus () {

    if [[ $(bluetoothctl show | grep Powered | awk '{print $2}') == 'yes' ]] 
    then
        echo 'enabled'
    else
        echo 'disabled'
    fi

}


GetDevices () {
    
    # Get json array of the names of paired devices 
    paired_devices=$(bluetoothctl devices Paired | cut -d " " -f3-) 
    # Get json array of the names of connected devices
    connected_devices=$(bluetoothctl devices Connected | cut -d " " -f3-) 

    # Create a string of eww buttons containing connected or paired bluetooth devices
    eww_widget_string_connected=""
    eww_widget_string_paired=""

    IFS=$'\n' # Let for loop read until end of line character is reached in each iteration
    for device in $paired_devices
    do
        # Get mac address of current device which is used to establish a connection
        macAddress=$(bluetoothctl devices Paired | grep "${device}" | cut -d " " -f2)

        # Check if the device is connected or not.
        # If device is not connected, add eww button that connects on button click to the paired eww widget string.
        # If the device is connected, add eww button with different class (i.e. appearance) that disconnect 
        # on button click to the connected eww widget string
        if [[ "$connected_devices" != *"$device"* ]] 
        then
            eww_widget_string_paired+="(button :class 'bluetoothPairedItemBtn' :onclick 'bluetoothctl connect $macAddress' '$device')"
        else
            eww_widget_string_connected+="(button :class 'bluetoothConnectedItemBtn' :onclick 'bluetoothctl disconnect $macAddress' '$device')"
        fi
    done

    # Echo eww box containing all paired bluetooth devices
    echo "
    (box 
        :orientation 'vertical'
        :space-evenly false
        :vexpand true

        (label 
          :class 'separatorLabel'
          :text 'Connected'
        )

        (scroll 
            :class 'bluetoothMenuScroll'
            :vexpand true
            :visible $([ -z "$eww_widget_string_connected" ] && echo 'false' || echo 'true' )
            (box 
                :class 'bluetoothMenuBox' 
                :orientation 'vertical' 
                :space-evenly false
                ${eww_widget_string_connected}
            )
        ) 
        
        (label 
          :class 'separatorLabel'
          :text 'Paired'
        )
        
        (scroll 
            :class 'bluetoothMenuScroll' 
            :vexpand true
            (box 
                :class 'bluetoothMenuBox' 
                :orientation 'vertical' 
                :space-evenly false 
                ${eww_widget_string_paired}
            )
        ) 
)
"
}


# Toggle bluetooth On or Off
toggleBluetooth () {

    if [[ $(GetBluetoothStatus) == 'enabled' ]] 
    then 
        bluetoothctl power off 
    else 
        bluetoothctl power on
    fi

}


"$@"
