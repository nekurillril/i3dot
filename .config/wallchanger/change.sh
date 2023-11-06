#!/bin/bash
pic=$HOME/Pictures/wallpaper/
rofipic="$(ls "$pic" | rofi -dmenu)"

feh --bg-scale "$pic"/"$rofipic"
