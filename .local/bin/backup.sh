#!/usr/bin/env bash

OUT1="vps_backup:/home/davide/backup"

(rsync \
    -arzp --delete \
    -e 'ssh -o ConnectTimeout=10' \
    "$HOME"/{docs,uni} \
    $OUT1 \
    && dunstify -t 2000 "Backup Done 💾" "Home is Safe in pi4!") \
    || dunstify -t 2000 "Backup Failed ❌" "Home isn't Safe in pi4!"
