#!/bin/sh

current=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Extract leading number from workspace name (handles names like "1: Web")
current_num=$(echo "$current" | grep -oE '^[0-9]+')
if [ -z "$current_num" ]; then
  current_num=1
fi

prev=$((current_num - 1))
if [ "$prev" -lt 1 ]; then
  prev=9
fi

swaymsg workspace number "$prev"
