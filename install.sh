mkdir ~/Applications
cd ~/Applications

# Basics Hyprland 
sudo pacman -S zsh hyprland ttf-jetbrains-mono-nerd sddm swaync xdg-desktop-portal-hyprland qt5-wayland qt6-wayland git base-devel 

# Audio related essentails
sudo pacman -S pipewire pipewire-alsa pipewire-pulse wireplumber alsa-utils pavucontrol alsa-firmware sof-firmware

# Bluetooth related essentails
sudo pacman -S bluez bluez-utils blueman

# System  basics
sudo pacman -S rofi-wayland tmux openssh neovim unzip nodejs npm brightnessctl wl-clipboard net-tools bc upower socat

# Usefull CLI tools
sudo pacman -S exa bandwhich fzf bat duf zoxide entr ripgrep tldr

# Install eww with an AUR helper (preferred)
paru -S git-eww

# Install eww manually
# sudo pacman -S gtk3 gtk-layer-shell pango gdk-pixbuf2 libdbusmenu-gtk3 cairo glib2 gcc-libs glibc # dependencies
# git clone https://github.com/elkowar/eww
# cd eww
# cargo build --release --no-default-features --features=wayland
# cd target/release
# chmod +x ./eww
#
paru -S pyprland

# Enable Services
sudo stystemctl enable sddm.service
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo If you are using Nvidia please check out the official hyprland docs on how to use Nvidia!
