#!/bin/sh

current=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Extract leading number from workspace name (handles names like "1: Web")
current_num=$(echo "$current" | grep -oE '^[0-9]+')
if [ -z "$current_num" ]; then
  current_num=1
fi

next=$((current_num + 1))
if [ "$next" -gt 9 ]; then
  next=1
fi

swaymsg workspace number "$next"
