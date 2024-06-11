#!/bin/bash
pic=$HOME/Pictures/wallpaper/
rofipic="$(ls "$pic" | rofi -dmenu -p "    ")"

feh --bg-fill "$pic"/"$rofipic"
