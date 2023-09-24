#!/usr/bin/bash

GetVolume () {
    echo "$(pamixer --get-volume)"
}

GetVolumeIcon () {

    volume=$(GetVolume)
    mute_state=$(pamixer --get-mute)

    if [ "$mute_state" == "true" ] 
    then 
        echo 󰖁
    elif [[ $volume -eq 0 ]] 
    then 
        echo  
    elif [[ $volume -le 33 ]]
    then
        echo  
    elif [[ $volume -le 66 ]] 
    then 
        echo 墳 
    else 
        echo 
    fi

}


"$@"

