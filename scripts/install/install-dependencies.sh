#!/bin/bash
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "Basics Hyprland"
sudo pacman -S --needed zsh hyprland ttf-jetbrains-mono-nerd sddm swaync xdg-desktop-portal-hyprland qt5-wayland qt6-wayland git base-devel hyprlock polkit polkit-kde-agent xorg-xhost

echo "Audio related essentails"
sudo pacman -S --needed pipewire pipewire-alsa pipewire-pulse wireplumber alsa-utils pavucontrol alsa-firmware sof-firmware

echo "Bluetooth related essentails"
sudo pacman -S --needed bluez bluez-utils blueman

echo "System basics"
sudo pacman -S --needed openssh unzip nodejs npm brightnessctl wl-clipboard net-tools bc upower socat i2c-tools ddcutil cpio cmake bind imagemagick
# Basic system applications
sudo pacman -S --needed gwenview neovim tmux thunar

echo "Usefull CLI tools"
sudo pacman -S --needed exa bandwhich fzf bat duf zoxide entr ripgrep tldr

echo "Rice specific applications"
paru -S --needed pyprland eww-git wlogout swaync
sudo pacman -S --needed rofi-wayland swww
# Screenshots
sudo pacman -S --needed grim slurp hyprpicker
# Theming
sudo pacman -S --needed kvantum qt5-base qt6-base kvantum-qt5 qt5-wayland qt6-wayland qt6ct

echo "Enable Services"
sudo systemctl enable sddm.service
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

echo "Install hyprland plugins"
hyprpm update

# grid style overview of workspaces
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo

# transparency without affecting readability
hyprpm add https://github.com/alexhulbert/Hyprchroma
hyprpm enable hyprchroma

# workspace overview similar to that of KDE Plasma, GNOME
hyprpm add https://github.com/KZDKM/Hyprspace
hyprpm enable Hyprspace

hyprpm reload

echo "Install hyprwm tools"
sudo make install $DOTFILES_DIR/scripts/hyprwm-contrib/grimblast/
sudo make install $DOTFILES_DIR/scripts/hyprwm-contrib/shellevents/

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
