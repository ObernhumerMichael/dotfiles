mkdir ~/Applications
cd ~/Applications
# Basics Hyprland 
sudo pacman -S zsh hyprland ttf-jetbrains-mono-nerd sddm swaync pipewire wireplumber xdg-desktop-portal-hyprland qt5-wayland qt6-wayland git base-devel 
# Enable Login Manger
sudo stystemctl enable sddm.service

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# System 
sudo pacman -S rofi-wayland tmux openssh neovim unzip nodejs npm

# CLI tools
sudo pacman -S exa bandwhich fzf bat duf zoxide entr ripgrep tldr

# Install eww with a AUR helper (preferred)
paru -S eww

# Install eww manually
# sudo pacman -S gtk3 gtk-layer-shell pango gdk-pixbuf2 libdbusmenu-gtk3 cairo glib2 gcc-libs glibc # dependencies
# git clone https://github.com/elkowar/eww
# cd eww
# cargo build --release --no-default-features --features=wayland
# cd target/release
# chmod +x ./eww


echo If you are using Nvidia please check out the official hyprland docs on how to use Nvidia!
