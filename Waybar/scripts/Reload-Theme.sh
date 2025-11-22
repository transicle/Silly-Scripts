#!/bin/bash

WAYBAR_PATH="$HOME/.config/waybar"
TARGET_FILE="$WAYBAR_PATH/style.css"
LIGHT="$WAYBAR_PATH/themes/light.css"
DARK="$WAYBAR_PATH/themes/dark.css"

FIRST_LINE=$(sed -n '/./{s/^\xEF\xBB\xBF//;p;q}' "$TARGET_FILE")

if [[ "$FIRST_LINE" == "/* THEME: LIGHT */" ]]; then
    cp "$LIGHT" "$TARGET_FILE"
    echo "Refreshed Waybar configuration"
elif [[ "$FIRST_LINE" == "/* THEME: DARK */" ]]; then
	cp "$DARK" "$TARGET_FILE"
    echo "Refreshed Waybar configuration"
else
	echo "First line: '$FIRST_LINE'"
	echo "Cannot find valid theme header in: '$TARGET_FILE'"
fi