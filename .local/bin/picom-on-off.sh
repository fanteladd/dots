#!/bin/sh
# Toggle picom compositor

ps -C picom >/dev/null 2>&1

case "$?" in
    0)  killall picom &
        dunstify -t 5000 "Compositor turned OFF"
        ;;
    *)  picom --experimental-backend &
        dunstify -t 5000 "Compositor turned ON"
        ;;
esac
