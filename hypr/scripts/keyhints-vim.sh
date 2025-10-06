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
max_width=1000
max_height=500

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
    --title="Skróty Vim" \
    --no-buttons \
    --list \
    --column=Klawisz: \
    --column=Opis: \
    --column=Dodatkowe-Informacje: \
    --timeout-indicator=bottom \
"V" "Zaznacz całą linię" "V duże" \
"v" "Zacznij zaznaczać linię" "Użyj strzałek w lewo lub w prawo" \
"U" "Cofnij zmiany" "Cofnij zmiany" \
"P " "Wklej" "Wklej" \
"y" "Kopiuj" "Kopiuj" \
"x" "Usuń" "Usuń" \
"d" "Wytnij" "Wytnij" \
"r" "Wymień literę" "Wymień pojedyńczą literę" \
"R" "Wymień kilka liter" "Wymieniaj litery dopóki nie naciśniesz ESC" \
"J" "Połącz linie" "Połącz linię z następną pod spodem" \
"cc" "Wymień linię" "Wymień całą linię na coś innego" \
"s" "Usuń literę" "Usuń pojedyńczą literę" \
"S" "Usuń całą linię" "Usuwa całą linię" \
"CTRL + B" "Zmiany do przodu" "Przywróć zmiany które cofnąłeś" \
"i" "Tryb wprowadzania liter" "Wciśnij by móc zacząć pisać i edytować" \
"" "" "" \
