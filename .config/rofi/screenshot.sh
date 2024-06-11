#!/usr/bin/env bash

## rofi-screenshot
## Author: ceuk @ github
## Licence: WTFPL
## Usage: 
##    show the menu with rofi-screenshot
##    stop recording with rofi-screenshot -s

# Screenshot directory
screenshot_directory="$HOME/Pictures/Screenshots"

# set ffmpeg defaults
ffmpeg() {
    command ffmpeg -hide_banner -loglevel error -nostdin "$@"
}

video_to_gif() {
    ffmpeg -i "$1" -vf palettegen -f image2 -c:v png - |
    ffmpeg -i "$1" -i - -filter_complex paletteuse "$2"
}

countdown() {
  notify-send "Screenshot" "Recording in 3 seconds" -t 1000
  sleep 1
  notify-send "Screenshot" "Recording in 2 seconds" -t 1000
  sleep 1
  notify-send "Screenshot" "Recording in 1 seconds" -t 1000
  sleep 1
}

crtc() {
  notify-send "Screenshot" "Select a region to capture"
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q $(slop -n -f '-g %g ') png "$screenshot_directory/$dt.png"
  xclip -selection clipboard -t image/png "$screenshot_directory/$dt.png"
  notify-send "Screenshot" "Region saved to $screenshot_directory"
}

cstc() {
    dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q png "$screenshot_directory/$dt.png"
  xclip -selection clipboard -t image/png "$screenshot_directory/$dt.png"
  notify-send "Screenshot" "Screenshot saved to $screenshot_directory"
}

rvrtf() {
  notify-send "Screenshot" "Select a region to record"
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q $(slop -n -f '-g %g ' && countdown) rec "$screenshot_directory/$dt.mp4"
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

rvstf() {
  countdown
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q rec "$screenshot_directory/$dt.mp4"
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

get_options() {
  echo "  Capture Region"
  echo "  Capture Screen"
  echo "  Record Region (MP4)"
  echo "  Record Screen (MP4)"
}

check_deps() {
  if ! hash $1 2>/dev/null; then
    echo "Error: This script requires $1"
    exit 1
  fi
}

main() {
  # check dependencies
  check_deps slop
  check_deps ffcast
  check_deps ffmpeg
  check_deps xclip
  check_deps rofi

  if [[ $1 == '--help' ]] || [[ $1 = '-h' ]]
  then
    echo ### rofi-screenshot
    echo USAGE: rofi-screenshot [OPTION]
    echo \(no option\)
    echo "    show the screenshot menu"
    echo -s, --stop
    echo "    stop recording"
    echo -h, --help
    echo "    this screen"
    exit 1
  fi

  if [[ $1 = '--stop' ]] || [[ $1 = '-s' ]]
  then
    pkill -fxn '(/\S+)*ffmpeg\s.*\sx11grab\s.*'
    exit 1
  fi

  # Get choice from rofi
  choice=$( (get_options) | rofi -dmenu -i -fuzzy -p "    ")

  # If user has not picked anything, exit
  if [[ -z "${choice// }" ]]; then
      exit 1
  fi

  # run the selected command
  case $choice in
    '  Capture Region')
      crtc
      ;;
    '  Capture Screen')
      cstc
      ;;
    '  Record Region (MP4)')
      rvrtf
      ;;
    '  Record Screen (MP4)')
      rvstf
      ;;
  esac

  # done
  set -e
}

main $1 &

exit 0

!/bin/bash

