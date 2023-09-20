#!/bin/sh
# "Turn" on and off the nvidia gpu

ICON="/usr/share/icons/Papirus-Dark/64x64/apps/nvidia.svg"

if [ "$(/usr/bin/cat /sys/bus/pci/devices/0000:00:01.0/power/runtime_status)" = 'active' ]; then
    echo "GPU in use"
    if ps -C dunst >/dev/null 2>&1 ; then
        dunstify -t 5000 "GPU in use!" "Can't turn it off" -i "$ICON"
    fi
    exit 1
fi

if ! /usr/bin/cat /usr/share/glvnd/egl_vendor.d/10_nvidia.json ; then
    sudo /usr/bin/mv /usr/share/glvnd/egl_vendor.d/10_nvidia.json.bak /usr/share/glvnd/egl_vendor.d/10_nvidia.json

    echo "GPU turned on"
    if ps -C dunst >/dev/null 2>&1 ; then
        dunstify -t 5000 "GPU turned on" -i "$ICON"
    fi
    exit
fi

sudo /usr/bin/mv /usr/share/glvnd/egl_vendor.d/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json.bak
echo "GPU turned off"
if ps -C dunst >/dev/null 2>&1 ; then
    dunstify -t 5000 "GPU turned off" -i "$ICON"
fi
