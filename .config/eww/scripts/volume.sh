#!/usr/bin/bash

GetVolume () {
    echo "$(pamixer --get-volume)"
}


"$@"

