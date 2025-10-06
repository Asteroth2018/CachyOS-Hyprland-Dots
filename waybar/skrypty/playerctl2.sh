#!/bin/bash

# Exit if playerctl is not installed
if ! command -v playerctl &> /dev/null; then
    echo '{"text": "playerctl not found"}' >&2
    exit 1
fi

# Exit if no player is running or player is stopped
player_status=$(playerctl status 2> /dev/null)
if [[ $? -ne 0 || "$player_status" == "Stopped" ]]; then
    echo "{}" # Output empty JSON to hide the module
    exit 0
fi

# Get metadata
artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

# Exit if no metadata is available
if [ -z "$artist" ] && [ -z "$title" ]; then
    echo "{}" # Hide module if no metadata
    exit 0
fi

# Set class based on status for styling
if [ "$player_status" = "Playing" ]; then
    class="playing"
elif [ "$player_status" = "Paused" ]; then
    class="paused"
fi

# Format the text and the tooltip "mini player"
# The tooltip uses Pango markup for bolding
text="$artist - $title"
tooltip="<b>$title</b>\nby $artist\n\nStatus: $player_status"

# Output JSON for Waybar
jq -n --arg text "$text" --arg tooltip "$tooltip" --arg class "$class" \
   '{text: $text, tooltip: $tooltip, class: $class}'
