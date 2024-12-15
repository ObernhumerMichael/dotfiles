#!/bin/bash

# Check if Rofi is running
if pgrep -x rofi > /dev/null; then
    pkill -x rofi
else
    monitor=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true).name')
    ln -sf ~/.cache/wallpaper-selector/$monitor ~/.cache/wallpaper-selector/rofi

    # Resize to specific dimensions and keep the aspect ratio
    magick ~/.cache/wallpaper-selector/$monitor -resize 700x600^ -gravity center -extent 700x600 ~/.cache/wallpaper-selector/scaled-rofi.png

    rofi -config ~/.config/rofi/styles/style_01.rasi -show
fi
