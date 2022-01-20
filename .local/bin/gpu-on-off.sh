#!/bin/sh
# "Turn" on and off the nvidia gpu

ICON="/usr/share/icons/Papirus-Dark/64x64/apps/nvidia.svg"

if [ "$(cat /sys/bus/pci/devices/0000:00:01.0/power/runtime_status)" = 'active' ]; then
    echo "GPU in use"
    if ps -C dunst >/dev/null 2>&1 ; then
        dunstify -t 5000 "GPU in use!" "Can't turn it off" -i "$ICON"
    fi
    exit 1
fi

if ! doas nvidia-smi drain -m 1 -p 0000:01.00.0 ; then
    doas nvidia-smi drain -m 0 -p 0000:01.00.0
    echo "GPU turned on"
    if ps -C dunst >/dev/null 2>&1 ; then
        dunstify -t 5000 "GPU turned on" -i "$ICON"
    fi
    exit
fi

echo "GPU turned off"
if ps -C dunst >/dev/null 2>&1 ; then
    dunstify -t 5000 "GPU turned off" -i "$ICON"
fi
