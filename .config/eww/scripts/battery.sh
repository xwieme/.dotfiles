#!/usr/bin/bash

# Select battery icon based on the power level 
# and charging status
GetBatteryIcon () {

    power_level=$(cat /sys/class/power_supply/BAT0/capacity)
    charging_status=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$charging_status" = "Discharging" ]
    then

        if [[ power_level -le 5 ]]
        then
            # Send critical message if not already done 
            if [ "$(eww get showed_critical_battery_message)" = "False" ]
            then 
                notify-send "Critical battery level"
                eww update showed_critical_battery_message="True"
            fi
            echo 󰂃
        elif [[ power_level -le 10 ]]
        then
            echo 󰁺
        elif [[ power_level -le 20 ]]
        then
            echo 󰁻
        elif [[ power_level -le 30 ]]
        then
            # Send low battery message if not already done 
            if [ "$(eww get showed_low_battery_message)" = "False" ]
            then 
                notify-send "Low battery level"
                eww update showed_low_battery_message="True"
            fi
            echo 󰁼
        elif [[ power_level -le 40 ]]
        then 
            echo 󰁽
        elif [[ power_level -le 50 ]]
        then
            echo 󰁾
        elif [[ power_level -le 60 ]]
        then
            echo 󰁿
        elif [[ power_level -le 70 ]]
        then
            echo 󰂀
        elif [[ power_level -le 80 ]]
        then 
            echo 󰂁
        elif [[ power_level -le 90 ]]
        then 
            echo 󰂂
        else
            echo 󰁹
        fi
    else

        if [[ power_level -le 10 ]]
        then
            echo 󰢜
        elif [[ power_level -le 20 ]]
        then
            # Reset critical battery message status 
            eww update showed_critical_battery_message="False"
            echo 󰂆
        elif [[ power_level -le 30 ]]
        then
            echo 󰂇
        elif [[ power_level -le 40 ]]
        then 
            # Reset low battery message status 
            eww update showed_low_battery_message="False"
            echo 󰂈
        elif [[ power_level -le 50 ]]
        then
            echo 󰢝
        elif [[ power_level -le 60 ]]
        then
            echo 󰂉
        elif [[ power_level -le 70 ]]
        then
            echo 󰢞
        elif [[ power_level -le 80 ]]
        then 
            echo 󰂊
        elif [[ power_level -le 90 ]]
        then 
            echo 󰂋
        else
            echo 󰂅
        fi
    fi
}


# Select scss class of the battery widget based on the power level 
# and charging status
GetBatteryClass () {

    power_level=$(cat /sys/class/power_supply/BAT0/capacity)

    # If battery has critical battery level change scss class 
    # to criticalBatteryWidget to get attention the device must 
    # be charged or will power down soon 
    if [[ power_level -le 5 ]] 
    then 
        echo "criticalBatteryWidget"

    # If battery has low power change scss class to lowPowerBatteryWidget 
    # to show to device should be charged
    elif [[ power_level -le 30 ]]
    then
        echo "lowPowerBatteryWidget"

    # On normal battery level set scss class to normalPowerBatteryWidget
    else 
        echo "normalPowerBatteryWidget"
    fi
}


"$@"
