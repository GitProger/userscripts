#!/usr/bin/env bash

function camera {
    if [[ "$1" == "on" ]]; then
        sudo modprobe uvcvideo
    elif [[ "$1" == "off" ]]; then
        sudo modprobe -r uvcvideo
    fi
}

camera $1
