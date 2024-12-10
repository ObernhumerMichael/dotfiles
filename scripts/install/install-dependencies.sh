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
paru -S --needed pyprland eww-git wlogout swaync
sudo pacman -S --needed rofi-wayland swww


# Enable Services
sudo stystemctl enable sddm.service
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
