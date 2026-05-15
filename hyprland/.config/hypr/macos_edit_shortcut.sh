#!/usr/bin/env bash

set -euo pipefail

key="${1,,}"
class="$(hyprctl activewindow -j | jq -r '.class // ""' | tr '[:upper:]' '[:lower:]')"

case "$class" in
  *ghostty*|*kitty*)
    case "$key" in
      a) hyprctl dispatch sendshortcut SUPER,a,activewindow ;;
      c) hyprctl dispatch sendshortcut CTRL,Insert,activewindow ;;
      v) hyprctl dispatch sendshortcut SHIFT,Insert,activewindow ;;
      x) : ;;
    esac
    ;;
  *)
    case "$key" in
      a|c|v|x) hyprctl dispatch sendshortcut CTRL,"$key",activewindow ;;
    esac
    ;;
esac
