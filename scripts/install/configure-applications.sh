#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

seperate() {
  echo 
  printf '%*s\n' "$(tput cols)" '' | tr ' ' '#'
  echo 
}

echo "Theming Grub"
sudo sed -i '/GRUB_THEME/c\GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

seperate

echo "Theming SDDM"
SDDM_THEME_PATH="/usr/share/sddm/themes"
sudo cp -r $DOTFILES_DIR/sddm/catppuccin/src/ $SDDM_THEME_PATH/catppuccin-mocha
sudo cp -r $DOTFILES_DIR/sddm/catppuccin/pertheme/mocha.conf $SDDM_THEME_PATH/catppuccin-mocha/theme.conf

echo "[Theme] 
Current=catppuccin-mocha" | sudo tee /etc/sddm.conf > /dev/null
