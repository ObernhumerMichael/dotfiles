#!/bin/bash


# Check if jq is installed for parsing JSON
if ! command -v paru &>/dev/null; then
    echo "paru is required but not installed."
    echo "Install paru or use an other AUR helper and change it in the install.sh"
    exit 1
fi

mkdir ~/Applications
cd ~/Applications

# Basics Hyprland
echo "Basics Hyprland"
sudo pacman -S --needed zsh hyprland ttf-jetbrains-mono-nerd sddm swaync xdg-desktop-portal-hyprland qt5-wayland qt6-wayland git base-devel hyprlock polkit polkit-kde-agent xorg-xhost

# Audio related essentails
echo "Audio related essentails"
sudo pacman -S --needed pipewire pipewire-alsa pipewire-pulse wireplumber alsa-utils pavucontrol alsa-firmware sof-firmware

# Bluetooth related essentails
echo "Bluetooth related essentails"
sudo pacman -S --needed bluez bluez-utils blueman

# System basics
echo "System basics"
sudo pacman -S --needed tmux openssh neovim unzip nodejs npm brightnessctl wl-clipboard net-tools bc upower socat i2c-tools ddcutil

# Usefull CLI tools
echo "Usefull CLI tools"
sudo pacman -S --needed exa bandwhich fzf bat duf zoxide entr ripgrep tldr

# Rice specific applications
echo "Rice specific applications"
paru -S --needed pyprland eww-git wlogout
sudo pacman -S --needed rofi-wayland swww


# Enable Services
sudo stystemctl enable sddm.service
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Configure dotiles:"
./scripts/install/configure-dotfiles.sh
echo "\n"

echo "Create symlinks from the repo to the required destinations:"
./scripts/install/symlink-dotfiles.sh
echo "\n"

echo "Configure applications:"
./scripts/install/configure-applications.sh
echo "\n"

echo If you are using Nvidia please check out the official hyprland docs on how to use Nvidia!
