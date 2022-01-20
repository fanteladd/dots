#!/bin/sh -e

number=$(bspc-ordered-hide count)

if [ "$number" -ne 0 ]; then
    echo "󰄾 $number hidden"
else
    echo ""
fi
