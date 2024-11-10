#!/bin/sh

while true; do
    battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
    charging=$(upower -i "$(upower -e | grep BAT)" | grep -E "state" | awk '{print $2}')

    # Check if the battery is charging
    if [ "$charging" != "charging" ]; then
        if [ "$battery" -le 10 ]; then
            /usr/bin/notify-send -u critical "Critical battery: ${battery}%"
            sleep 240
        elif [ "$battery" -le 20 ]; then
            /usr/bin/notify-send -u normal "Low battery: ${battery}%"
            sleep 120
        else
            sleep 60
        fi
    else
        # If charging, just sleep to avoid notifications
        sleep 60
    fi
done
