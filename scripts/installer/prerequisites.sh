#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for prerequisites section"
print_info "\nStarting prerequisites setup..."

run_command "pacman -Syyu --noconfirm" "Updating package database and upgrading packages" "no"

run_command "pacman -S --noconfirm --needed git base-devel" "Installing YAY" "no"

run_command "git clone https://aur.archlinux.org/yay.git && cd yay" "Cloning YAY" "no" "no"

run_command "makepkg --noconfirm -si && cd .. # builds with makepkg" "Building YAY" "no" "no"

run_command "pacman -S --noconfirm pipewire pipewire-pulse lib32-pipewire pipewire-audio wireplumber pavucontrol pamixer" "Configuring audio" "no"

run_command "pacman -S --noconfirm gnome-keyring libsecret seahorse" "Installing Keystore" "no"

run_command "pacman -S --noconfirm ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono noto-fonts noto-fonts-emoji ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono" "Installing Nerd Fonts and Symbols" "no"

run_command "pacman -S --noconfirm sddm && systemctl enable sddm.service" "Installing and enabling SDDM" "no"

run_command "yay -S --sudoloop --noconfirm google-chrome" "Install Google Chrome" "yes" "no"

run_command "pacman -S --noconfirm kitty" "Installing Kitty" "no"

run_command "pacman -S --noconfirm nano" "Install nano" "no"

run_command "pacman -S --noconfirm tar" "Installing tar for extracting files" "no"

run_command "pacman -S --noconfirm nemo nemo-fileroller" "Installing Filemanager" "no"

echo "------------------------------------------------------------------------"
