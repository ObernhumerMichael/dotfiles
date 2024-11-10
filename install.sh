# Basics
sudo pacman -S zsh hyprland ttf-jetbrains-mono-nerd sddm swaync pipewire wireplumber xdg-desktop-portal-hyprland qt5-wayland qt6-wayland git base-devel firefox rofi-wayland tmux openssh neovim unzip nodejs npm

sudo stystemctl enable sddm.service

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# CLI tools
sudo pacman -S exa bandwhich fzf bat duf zoxide entr ripgrep

echo If you are using Nvidia please check out the official hyprland docs on how to use Nvidia!

