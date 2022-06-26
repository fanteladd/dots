#!/usr/bin/env bash

OUT1="pi4:~/media/backup"

(rsync \
    -arzp --delete \
    --exclude={'docs/iso','docs/android'} \
    -e 'ssh -o ConnectTimeout=10' \
    "$HOME"/{pics,docs,uni} \
    $OUT1 \
    && dunstify -t 2000 "Backup Done 💾" "Home is Safe in pi4!") \
    || dunstify -t 2000 "Backup Failed ❌" "Home isn't Safe in pi4!"
