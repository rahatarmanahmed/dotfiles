#!/bin/bash

# Function to get current volume and mute status for a given sink/source
get_audio_info() {
    local device="$1"
    wpctl_info=$(wpctl get-volume "$device")
    
    # Extract volume percentage
    # wpctl output is like "Volume: 0.75"
    volume_float=$(echo "$wpctl_info" | awk '{print $2}')
    volume_percentage=$(printf "%.0f" "$(echo "$volume_float * 100" | bc)")

    # Check for mute status
    is_muted=$(echo "$wpctl_info" | grep -q 'MUTED' && echo "true" || echo "false")
    
    echo "$volume_percentage $is_muted"
}

# Function to display volume notification
show_volume_notification() {
    volume_info=$(get_audio_info @DEFAULT_AUDIO_SINK@)
    volume_percentage=$(echo "$volume_info" | awk '{print $1}')
    is_muted=$(echo "$volume_info" | awk '{print $2}')

    if [ "$is_muted" = "true" ]; then
        notify-send -h string:x-canonical-private-synchronous:volume_notification -u low "Volume Muted" -i audio-volume-muted
    else
        # Choose icon based on volume level
        if (( volume_percentage == 0 )); then
            icon="audio-volume-off"
        elif (( volume_percentage < 33 )); then
            icon="audio-volume-low"
        elif (( volume_percentage < 66 )); then
            icon="audio-volume-medium"
        else
            icon="audio-volume-high"
        fi
        notify-send -h string:x-canonical-private-synchronous:volume_notification -h int:value:"$volume_percentage" -u low "Volume: ${volume_percentage}%" -i "$icon"
    fi
}

# Function to display mic notification
show_mic_notification() {
    mic_info=$(get_audio_info @DEFAULT_AUDIO_SOURCE@)
    # We only care about mute status for mic
    is_muted=$(echo "$mic_info" | awk '{print $2}')

    if [ "$is_muted" = "true" ]; then
        notify-send -h string:x-canonical-private-synchronous:mic_notification -u low "Microphone Muted" -i audio-input-microphone-muted
    else
        notify-send -h string:x-canonical-private-synchronous:mic_notification -u low "Microphone Unmuted" -i audio-input-microphone
    fi
}

case "$1" in
    raise)
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        show_volume_notification
        ;;
    lower)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        show_volume_notification
        ;;
    toggle_mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        show_volume_notification
        ;;
    toggle_mic_mute)
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        show_mic_notification
        ;;
    *)
        echo "Usage: $0 {raise|lower|toggle_mute|toggle_mic_mute}"
        exit 1
        ;;
esac
