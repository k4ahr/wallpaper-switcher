#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/wallpaper-switcher/wallpaper"

# List all image files in the directory and store both full paths and filenames
WALLPAPERS=($(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png} 2> /dev/null))
FILENAMES=($(basename -a "${WALLPAPERS[@]}"))

# If no wallpapers are found, exit the script
if [ ${#FILENAMES[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Use wofi to select a wallpaper (only showing filenames)
SELECTED_FILENAME=$(printf "%s\n" "${FILENAMES[@]}" | wofi --dmenu --prompt="Select a wallpaper")

# Find the full path corresponding to the selected filename
for i in "${!FILENAMES[@]}"; do
    if [ "${FILENAMES[$i]}" == "$SELECTED_FILENAME" ]; then
        SELECTED="${WALLPAPERS[$i]}"
        break
    fi
done

# Debugging output
echo "Selected wallpaper: $SELECTED" >> /tmp/wallpaper_switcher.log

# If a wallpaper was selected, set it using swww, apply the colors with pywal, and update spicetify
if [ -n "$SELECTED" ]; then
    swww img "$SELECTED" >> /tmp/wallpaper_switcher.log 2>&1
    wal -i "$SELECTED" >> /tmp/wallpaper_switcher.log 2>&1
    pywal-spicetify text >> /tmp/wallpaper_switcher.log 2>&1
else
    echo "No wallpaper selected." >> /tmp/wallpaper_switcher.log
fi
