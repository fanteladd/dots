#!/usr/bin/env bash

OUT1="pi4:/home/davide/media/backup"

(rsync \
    -arzp --delete \
    -e 'ssh -o ConnectTimeout=10' \
    "$HOME"/{docs,uni,pics} \
    $OUT1 \
    && dunstify -t 2000 "Backup Done 💾" "Home is Safe in pi4!") \
    || dunstify -t 2000 "Backup Failed ❌" "Home isn't Safe in pi4!"
