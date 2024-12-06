#!/bin/bash

# Check if Rofi is running
if pgrep -x rofi > /dev/null; then
    pkill -x rofi
else
    monitor=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true).name')
    ln -sf ~/.cache/wallpaper-selector/$monitor ~/.cache/wallpaper-selector/rofi
    rofi -config ~/.config/rofi/styles/style_01.rasi -show
fi
