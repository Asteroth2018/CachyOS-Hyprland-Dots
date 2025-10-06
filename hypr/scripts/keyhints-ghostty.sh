#!/bin/bash

# Keyhints. Idea got from Garuda Hyprland
# Modified by @st3r0th

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# Calculate width and height based on percentages and monitor resolution
width=$((x_mon * hypr_scale / 100))
height=$((y_mon * hypr_scale / 100))

# Set maximum width and height
max_width=860
max_height=370

# Set percentage of screen size for dynamic adjustment
percentage_width=70
percentage_height=70

# Calculate dynamic width and height
dynamic_width=$((width * percentage_width / 100))
dynamic_height=$((height * percentage_height / 100))

# Limit width and height to maximum values
dynamic_width=$(($dynamic_width > $max_width ? $max_width : $dynamic_width))
dynamic_height=$(($dynamic_height > $max_height ? $max_height : $dynamic_height))

# Launch yad with calculated width and height
yad --width=$dynamic_width --height=$dynamic_height \
    --center \
    --title="Skróty Kitty" \
    --no-buttons \
    --list \
    --column=Klawisz: \
    --column=Opis: \
    --column=Dodatkowe-Informacje: \
    --timeout-indicator=bottom \
"Ctrl + Shift + n     |" "Otwórz osobne nowe okno  |" "To nie split tylko nowe okno |" \
"Ctrl + Shift + e     |" "Otwórz nowe okno split   |" "To dzieli okno na pół |" \
"Ctrl + Super + ]     |" "Przełączaj między oknami |" "Zmienia aktywne okno |" \
"Ctrl + Shift + q     |" "Zamknij aktywne okno     |" "Zamknij okno |" \
"Ctrl + Shift + l     |" "Zmień rozłożenie splita  |" "Zmień czy wzdłuż czy wszerz |" \
">>>>>>>>>>>>>>>>" ">>>>>>>>>>>>>>>>>>>>>>>>>>" ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" \
"<<<<<<<<<<<<<<<<" "<<<<<<<<<<<<<<<<<<<<<<<<<<" "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" \
"Ctrl + Shift + t     |" "Nowa zakładka            |" "Otwórz nową zakładkę |" \
"Ctrl + Shift + Tab   |" "Zmień zakładkę           |" "Przejdź do następnej zakładki |" \
"Ctrl + Shift + w     |" "Zamknij zakładkę         |" "Zamknij zakładkę w której jesteś |" \
"" "" "" \
