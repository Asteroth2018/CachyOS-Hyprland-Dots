#!/bin/bash

# Playerctl

music_icon="$HOME/.config/swaync/icons/music.png"

# Play the next track
play_next() {
    playerctl --player=spotify,starwberry,musikcube,org.strawberrymusicplayer.strawberry,org.gnome.Decibels,com.github.neithern.g4music,audacious,vlc,%any next
    show_music_notification
}

# Play the previous track
play_previous() {
    playerctl --player=spotify,starwberry,musikcube,org.strawberrymusicplayer.strawberry,org.gnome.Decibels,com.github.neithern.g4music,audacious,vlc,%any previous
    show_music_notification
}

# Toggle play/pause
toggle_play_pause() {
    playerctl --player=spotify,starwberry,musikcube,org.strawberrymusicplayer.strawberry,org.gnome.Decibels,com.github.neithern.g4music,audacious,vlc,%any play-pause
    show_music_notification
}

# Stop playback
stop_playback() {
    playerctl --player=spotify,starwberry,musikcube,org.strawberrymusicplayer.strawberry,org.gnome.Decibels,com.github.neithern.g4music,audacious,vlc,%any stop
    notify-send -e -u low -i "$music_icon" " Playback Stopped"
}

# Display notification with song information
show_music_notification() {
    status=$(playerctl --player=spotify,starwberry,musikcube,org.strawberrymusicplayer.strawberry,org.gnome.Decibels,com.github.neithern.g4music,audacious,vlc,%any status)
    if [[ "$status" == "Playing" ]]; then
        song_title=$(playerctl --player=spotify,starwberry,musikcube,org.strawberrymusicplayer.strawberry,org.gnome.Decibels,com.github.neithern.g4music,audacious,vlc,%any metadata title)
        song_artist=$(playerctl --player=spotify,starwberry,musikcube,org.strawberrymusicplayer.strawberry,org.gnome.Decibels,com.github.neithern.g4music,audacious,vlc,%any metadata artist)
        notify-send -e -u low -i "$music_icon" "  Now Playing:" "   $song_title\n   by $song_artist"
    elif [[ "$status" == "Paused" ]]; then
        notify-send -e -u low -i "$music_icon" " Playback Paused"
    fi
}

# Get media control action from command line argument
case "$1" in
    "--nxt")
        play_next
        ;;
    "--prv")
        play_previous
        ;;
    "--pause")
        toggle_play_pause
        ;;
    "--stop")
        stop_playback
        ;;
    *)
        echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
        exit 1
        ;;
esac
