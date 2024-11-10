sudo pacman -S zsh hyprland ttf-jetbrains-mono-nerd sddm swaync pipewire wireplumber xdg-desktop-portal-hyprland qt5-wayland qt6-wayland git base-devel firefox rofi-wayland tmux bitwarden openssh neovim unzip nodejs npm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo stystemctl enable sddm.service

echo If you are using Nvidia please check out the official hyprland docs on how to use Nvidia!
