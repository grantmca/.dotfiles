#!/bin/sh
# Navigate to next workspace (cycles 1-9)

current=$(hyprctl activeworkspace -j | jq -r '.id')

if [ -z "$current" ] || ! echo "$current" | grep -qE '^[0-9]+$'; then
    current=1
fi

next=$((current + 1))
if [ "$next" -gt 9 ]; then
    next=1
fi

hyprctl dispatch workspace "$next"
