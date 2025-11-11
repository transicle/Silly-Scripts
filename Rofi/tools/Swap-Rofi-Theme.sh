#!/bin/bash

ROFI_PATH="$HOME/.config/rofi"
TARGET_FILE="$ROFI_PATH/shared/theme.rasi"
LIGHT="$ROFI_PATH/tools/light.rasi"
DARK="$ROFI_PATH/tools/dark.rasi"

FIRST_LINE=$(sed -n '/./{s/^\xEF\xBB\xBF//;p;q}' "$TARGET_FILE")

if [[ "$FIRST_LINE" == "/* THEME: LIGHT */" ]]; then
	cp "$DARK" "$TARGET_FILE"
	echo "Swapped Rofi configuration to DARK mode"
elif [[ "$FIRST_LINE" == "/* THEME: DARK */" ]]; then
	cp "$LIGHT" "$TARGET_FILE"
	echo "Swapped Rofi configuration to LIGHT mode"
else
	echo "First line: '$FIRST_LINE'"
	echo "Cannot find valid theme header in: '$TARGET_FILE'"
fi
