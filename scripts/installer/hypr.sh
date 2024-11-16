#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for hypr section"
print_info "\nStarting hypr setup..."
print_info "\nEverything is recommended to INSTALL"

run_command "pacman -S --noconfirm hyprland" "Installing Hyprland (Must)" "no"

run_command "mkdir -p /home/$SUDO_USER/.config/hypr/ && cp -r /home/$SUDO_USER/dotfiles/configs/hypr/hyprland.conf /home/$SUDO_USER/.config/hypr/" "Copying hyprland config" "no"

run_command "pacman -S --noconfirm xdg-desktop-portal-hyprland" "Installing XDG desktop portal for Hyprland" "no"

run_command "pacman -S --noconfirm polkit-kde-agent" "Installing KDE Polkit agent for authentication dialogs" "no"

run_command "pacman -S --noconfirm dunst" "Install Dunst notification daemon" "yes"

run_command "cp -r /home/$SUDO_USER/dotfiles/configs/dunst /home/$SUDO_USER/.config/" "Copy dunst config" "yes"

run_command "pacman -S --noconfirm qt5-wayland qt6-wayland" "Installing QT support on wayland" "no"

echo "------------------------------------------------------------------------"
