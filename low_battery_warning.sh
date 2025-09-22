#!/bin/bash

# Minimum battery level for notification
THRESHOLD=10

# We get information about the battery 
BATTERY_INFO=$(cat /sys/class/power_supply/BAT?/capacity)
STATE=$(cat /sys/class/power_supply/BAT?/status)

# If the level is below the threshold and the battery is running low, we send a notification
if [ "$BATTERY_INFO" -le "$THRESHOLD" ] && [ "$STATE" = "Discharging" ]; then
    notify-send -u critical "low battery"
fi

