#!/bin/bash
TOGGLE_FILE="$HOME/.config/hypr/rotation-toggle"

[ -f "$TOGGLE_FILE" ] || echo "1" > "$TOGGLE_FILE"

monitor-sensor | while read -r line; do
  if [ "$(cat "$TOGGLE_FILE")" -eq 1 ]; then
    if [[ $line == *"orientation changed: normal"* ]]; then
      hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "0x0", scale = "auto", transform = 0 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539", transform = 0 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539-stylus", transform = 0 })'
    elif [[ $line == *"orientation changed: right-up"* ]]; then
      hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "0x0", scale = "auto", transform = 3 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539", transform = 3 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539-stylus", transform = 0 })'
    elif [[ $line == *"orientation changed: left-up"* ]]; then
      hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "0x0", scale = "auto", transform = 1 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539", transform = 1 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539-stylus", transform = 1 })'
    elif [[ $line == *"orientation changed: bottom-up"* ]]; then
      hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "0x0", scale = "auto", transform = 2 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539", transform = 2 })'
      hyprctl eval 'hl.device({ name = "ilit2901:00-222a:5539-stylus", transform = 2 })'
    fi
  fi
done

