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
sudo pacman -S --needed tmux openssh neovim unzip nodejs npm brightnessctl wl-clipboard net-tools bc upower socat i2c-tools ddcutil cpio cmake bind

# Basic system applications
sudo pacman -S --needed gwenview
paru -S --needed nomacs

# Usefull CLI tools
echo "Usefull CLI tools"
sudo pacman -S --needed exa bandwhich fzf bat duf zoxide entr ripgrep tldr

# Rice specific applications
echo "Rice specific applications"
paru -S --needed pyprland eww-git wlogout swaync
sudo pacman -S --needed rofi-wayland swww
# Screen shots
sudo pacman -S --needed grim slurp hyprpicker

# Enable Services
sudo systemctl enable sddm.service
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Hyprland plugins
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

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
