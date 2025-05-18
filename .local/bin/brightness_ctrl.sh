#!/bin/bash

# Function to get current brightness
get_brightness_info() {
    # Get current brightness value (e.g., 500)
    current_brightness=$(brightnessctl get)
    # Get max brightness value (e.g., 1000)
    max_brightness=$(brightnessctl max)

    # Calculate percentage
    if (( max_brightness == 0 )); then
        brightness_percentage=0
    else
        brightness_percentage=$(( (current_brightness * 100) / max_brightness ))
    fi
    echo "$brightness_percentage"
}

# Function to display notification
show_brightness_notification() {
    brightness_percentage=$(get_brightness_info)

    # Choose icon based on brightness level
    if (( brightness_percentage == 0 )); then
        icon="display-brightness-off" # Or a suitable dark icon if available
    elif (( brightness_percentage < 50 )); then
        icon="display-brightness-low"
    else
        icon="display-brightness-high"
    fi

    notify-send -h string:x-canonical-private-synchronous:brightness_notification -h int:value:"$brightness_percentage" -u low "Brightness: ${brightness_percentage}%" -i "$icon"
}

case "$1" in
    up)
        brightnessctl s 5%+
        show_brightness_notification
        ;;
    down)
        brightnessctl s 5%-
        show_brightness_notification
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
