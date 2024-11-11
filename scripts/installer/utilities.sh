#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "pacman -S --noconfirm waybar python python-gobject brightnessctl playerctl" "Install Waybar - Status Bar" "yes"
run_command "cp -r /home/$SUDO_USER/dotfiles/configs/waybar /home/$SUDO_USER/.config/" "Copy Waybar config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm tofi" "Install Tofi - Application Launcher" "yes" "no"
run_command "cp -r /home/$SUDO_USER/dotfiles/configs/tofi /home/$SUDO_USER/.config/" "Copy Tofi config(s)" "yes" "no"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

run_command "yay -S --sudoloop --noconfirm swww" "Install SWWW for wallpaper management" "yes" "no"
run_command "mkdir -p /home/$SUDO_USER/.config/assets/backgrounds && cp -r /home/$SUDO_USER/dotfiles/assets/backgrounds /home/$SUDO_USER/.config/assets/" "Copy sample wallpapers to assets directory (Recommended)" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprpicker" "Install Hyprpicker - Color Picker" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprlock" "Install Hyprlock - Screen Locker (Must)" "yes" "no"
run_command "cp -r /home/$SUDO_USER/dotfiles/configs/hypr/hyprlock.conf /home/$SUDO_USER/.config/hypr/" "Copy Hyprlock config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm wlogout" "Install Wlogout - Session Manager" "yes" "no"
run_command "cp -r /home/$SUDO_USER/dotfiles/configs/wlogout /home/$SUDO_USER/.config/ && mkdir /usr/local/share/wlogout && cp -r /home/$SUDO_USER/dotfiles/assets/wlogout /usr/local/share/" "Copy Wlogout config and assets" "yes" "no"

run_command "yay -S --sudoloop --noconfirm grimblast" "Install Grimblast - Screenshot tool" "yes" "no"

run_command "yay -S --sudoloop --noconfirm bluez bluez-libs bluez-utils blueman && systemctl enable --now bluetooth.service" "Install & Enable Bluetooth" "yes" "no"

run_command "yay -S --sudoloop --noconfirm jome" "Install Emoji-Picker" "yes" "no"

run_command "yay -S --sudoloop --noconfirm unityhub jetbrains-toolbox node" "Install Unity Dev-Tools" "yes" "no"

run_command "yay -S --sudoloop --noconfirm fastfetch" "Install Fasfetch" "yes" "no"
run_command "cp -r /home/$SUDO_USER/dotfiles/configs/fastfetch /home/$SUDO_USER/.config/" "Copy Fastfetch Settings" "yes "no"

echo "------------------------------------------------------------------------"
