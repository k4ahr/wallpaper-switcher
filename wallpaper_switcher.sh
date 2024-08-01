#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/wallpaper_switcher/wallpaper"

# List all image files in the directory
WALLPAPERS=($(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png} 2> /dev/null))

# If no wallpapers are found, exit the script
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Use wofi to select a wallpaper
SELECTED=$(printf "%s\n" "${WALLPAPERS[@]}" | wofi --dmenu --prompt="Select a wallpaper")

# If a wallpaper was selected, set it using swww
if [ -n "$SELECTED" ]; then
    swww img "$SELECTED"
fi
