#!/bin/sh

status=$(cat /sys/bus/pci/devices/0000:00:01.0/power/runtime_status)

if [ "$status" = 'active' ]; then
    gputemp="$(nvidia-smi --format=nounits,csv,noheader --query-gpu=temperature.gpu)"
    echo "GPU: $gputemp°C "
else
    echo ""
fi
