#!/bin/bash

WAYBAR_DIR="$HOME/.config/waybar"
THEMES_DIR="$WAYBAR_DIR/themes"

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
pkill -x waybar 2>/dev/null || true

while pgrep -x waybar >/dev/null; do
    sleep 0.1
done

# Start waybar with selected theme

nohup waybar -c "$THEME_PATH/config.jsonc" -s "$THEME_PATH/style.css" \
    > "$WAYBAR_DIR/waybar.log" 2>&1 &


echo "Waybar theme changed to: $THEME"