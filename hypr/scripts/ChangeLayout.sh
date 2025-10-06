#!/bin/bash

# for changing Hyprland Layouts (Master or Dwindle) on the fly

notif="$HOME/.config/swaync/images/bell.png"

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
	hyprctl keyword general:layout dwindle
	hyprctl keyword bind SUPER,U,togglesplit
  notify-send -e -u low -i "$notif" "Master Layout"
	;;
"dwindle")
	hyprctl keyword general:layout master
        hyprctl keyword unbind SUPER,U
  notify-send -e -u low -i "$notif" "Dwindle Layout"
	;;
*) ;;

esac
