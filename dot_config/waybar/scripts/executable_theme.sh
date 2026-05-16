#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: waybar-theme <theme-name>"
    echo "Available themes:"
    ls ~/.config/waybar/themes/
    exit 1
fi

THEME="$1"
THEME_PATH="$HOME/.config/waybar/themes/$THEME"

if [ ! -d "$THEME_PATH" ]; then
    echo "Error: Theme '$THEME' not found"
    echo "Available themes:"
    ls ~/.config/waybar/themes/
    exit 1
fi

# Kill current waybar
killall waybar 2>/dev/null

# Start waybar with selected theme
waybar -c "$THEME_PATH/config.jsonc" -s "$THEME_PATH/style.css" &
echo "Waybar theme changed to: $THEME"