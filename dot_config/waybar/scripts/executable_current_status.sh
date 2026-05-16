#!/bin/bash
current=$(hyprctl getoption animations:enabled -j | jq -r '.int')

if [ "$current" -eq 1 ]; then
    echo '{"text": "󱗁", "tooltip": "Animations ON"}'
else
    echo '{"text": "󱙷", "tooltip": "Animations OFF"}'
fi