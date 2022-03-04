#!/usr/bin/env bash

OUT1="pi4:~/media/backup"

(rsync \
    -arzp --delete \
    --exclude={'docs/iso','docs/android'} \
    -e 'ssh -o ConnectTimeout=10' \
    "$HOME"/{pics,docs,uni} \
    $OUT1 \
    && notify-send "Backup Done 💾" "Home is Safe in pi4!") \
    || notify-send "Backup Failed ❌" "Home isn't Safe in pi4!"
