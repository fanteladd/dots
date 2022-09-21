#!/usr/bin/env bash
#

time=$(date +"%H:%M %P")
date=$(date +"%a, %d %b")
echo $time
echo $date
echo ''
bat=$(cat /sys/class/power_supply/BAT0/capacity)
echo 'Batteria: '$bat'%'
vol=$(pamixer --get-volume)
echo 'Volume: '$vol'%'
screen=$(brightnessctl| sed -En 's/.*\(([0-9]+)%\).*/\1/p')
echo 'Luminosità: '$screen'%'
