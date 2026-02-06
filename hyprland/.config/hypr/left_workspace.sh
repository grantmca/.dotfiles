#!/bin/sh
# Navigate to previous workspace (cycles 1-9)

current=$(hyprctl activeworkspace -j | jq -r '.id')

if [ -z "$current" ] || ! echo "$current" | grep -qE '^[0-9]+$'; then
    current=1
fi

prev=$((current - 1))
if [ "$prev" -lt 1 ]; then
    prev=9
fi

hyprctl dispatch workspace "$prev"
