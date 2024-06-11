#!/usr/bin/env bash

cases() {
	echo "󰄜 Mobile"
	echo "󰄡 Doc"
	echo "󰇄 VGA"
}

main() {
	choice=$( (cases) | rofi -dmenu -i -fuzzy -p "    ")

  # If user has not picked anything, exit
  if [[ -z "${choice// }" ]]; then
      exit 1
  fi

  # run the selected command
  case $choice in
    '󰄜 Mobile')
      autorandr mobile
      ;;
    '󰄡 Doc')
      autorandr doc
      ;;
    '󰇄 VGA')
      autorandr vga
      ;;
  esac

  # done
  #set -e
}

main $1 &

exit 0

!/bin/bash