#!/usr/bin/env bash
 
# toggle_gaps [on|off|toggle]
 
INNER=5
OUTER=5
 
mode=$1
 
if [[ -z "$mode" || "$mode" == "toggle" ]]; then
 
    # Get current workspace.
    workspace=$(swaymsg -t get_workspaces \
            | jq -r '.[] | if .["focused"] then .["name"] else empty end')
    # Get current inner gap size. (0 means default)
    inner_gaps=$(swaymsg -t get_tree \
            | jq -r 'recurse(.nodes[]) | if .type == "workspace" and .name == "'"$workspace"'" then .gaps.inner else empty end')
 
    if [[   "$inner_gaps" == 0 ]]; then
        mode="off"
    else
        mode="on"
    fi
fi
 
if [[ "$mode" == "on" ]]; then
    swaymsg "gaps inner current set $INNER; gaps outer current set $OUTER"
else
    swaymsg "gaps inner current set 0; gaps outer current set 0"
fi
