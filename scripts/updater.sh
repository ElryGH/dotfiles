#!/bin/bash

# Get the directory of the base dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "Removing old dotfiles"
rm -rf "$SCRIPT_DIR/configs/*"

echo "Copy new dotfiles"
cp -rf ~/.config/hypr "$SCRIPT_DIR/configs/"
cp -rf ~/.config/dunst "$SCRIPT_DIR/configs/"
cp -rf ~/.config/kitty "$SCRIPT_DIR/configs/"
cp -rf ~/.config/tofi "$SCRIPT_DIR/configs/"
cp -rf ~/.config/waybar "$SCRIPT_DIR/configs/"
cp -rf ~/.config/wlogout "$SCRIPT_DIR/configs/"

echo "Copy Scripts"
cp ~/.local/share/bin/mediaplayer.py "$SCRIPT_DIR/assets/scripts/"
cp ~/.local/share/bin/low_battery.sh "$SCRIPT_DIR/assets/scripts/"

echo "Update done"
