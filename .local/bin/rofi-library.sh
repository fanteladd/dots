#!/bin/bash

library="$HOME/docs/libreria" # There are only pdfs, epubs, and djvus in here
cd $library

file=$(
    fd . -tf -e 'pdf' -e 'epub' -e 'djvu' | \
    rofi -dmenu -i -matching normal -p "󰗚"  \
)

# Open the file only if it exists
if [[ -e $file ]]; then
    zathura $library/"$file"
    exit 0
fi
exit 1
