#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        01d) icon="󰖙";;
        01n) icon="󰖔";;
        02d) icon="󰖕";;
        02n) icon="󰼱";;
        03*) icon="󰖐";;
        04*) icon="󰼯";;
        09d) icon="󰖖";;
        09n) icon="󰖖";;
        10d) icon="󰼳";;
        10n) icon="󰼳";;
        11d) icon="󰖓";;
        11n) icon="󰖓";;
        13d) icon="󰜗";;
        13n) icon="󰜗";;
        50d) icon="󰖑";;
        50n) icon="󰖑";;
        *) icon="";
    esac
    echo $icon
}

get_duration() {
    date --date="@$1" -u +%H:%M
}

KEY="207908b4dfe80a6d4f1b02459b18182d"
CITY="3178677"
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    current=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
    forecast=$(curl -sf "$API/forecast?appid=$KEY&$CITY_PARAM&units=$UNITS&cnt=1")
else
    location=$(curl -sf "https://location.services.mozilla.com/v1/geolocate?key=geoclue")

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        current=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
        forecast=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS&cnt=1")
    fi
fi

if [ -n "$current" ] && [ -n "$forecast" ]; then
    current_temp=$(echo "$current" | jq ".main.temp" | cut -d "." -f 1)
    current_icon=$(echo "$current" | jq -r ".weather[0].icon")

    forecast_temp=$(echo "$forecast" | jq ".list[].main.temp" | cut -d "." -f 1)
    forecast_icon=$(echo "$forecast" | jq -r ".list[].weather[0].icon")


    if [ "$current_temp" -gt "$forecast_temp" ]; then
        trend="󰔳"
    elif [ "$forecast_temp" -gt "$current_temp" ]; then
        trend="󰔵"
    else
        trend="󰔴"
    fi

    printf '%s' "{\"text\": \"-  $(get_icon "$current_icon")  $current_temp$SYMBOL\", \"alt\": \"-  $(get_icon "$forecast_icon") $trend $forecast_temp$SYMBOL\"}"
fi
