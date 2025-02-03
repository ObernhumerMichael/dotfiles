#!/bin/bash

echo "Configure optimus-manager"
DOTFILES_DIR=$1
CONF="$DOTFILES_DIR/other/optimus-manager.conf"
sudo cp $CONF /etc/optimus-manager/optimus-manager.conf

# NVIDIA specific launch scriptc
sudo cp "$DOTFILES_DIR/hypr/launch_hyprland.sh" /usr/local/bin/launch_hyprland.sh
sudo sed -i "s|Exec.*|Exec=/usr/local/bin/launch_hyprland.sh|" "/usr/share/wayland-sessions/hyprland.desktop"
