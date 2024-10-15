#!/bin/bash
pic=$HOME/Pictures/wallpaper/
rofipic="$(ls "$pic" | rofi -dmenu -fuzzy -p "  󰋫  ")"

# If user has not picked anything, exit
if [[ -z "${rofipic// }" ]]; then
    exit 1
fi

feh --bg-fill "$pic"/"$rofipic"
