#!/bin/bash
hyprctl monitors -j | jaq --raw-output .[0].activeWorkspace.id
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 awk -F '>>|,' '/^workspace>>/{print $2}'
