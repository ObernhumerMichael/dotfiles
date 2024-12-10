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

echo "Enabling SDDM Theme"
echo "[Theme]
Current=catppuccin-mocha" | sudo tee /etc/sddm.conf > /dev/null

seperate

echo "Theming thunderbird"
$DOTFILES_DIR/scripts/install/configure-applications/thunderbird.sh

seperate

echo "Install tmux plugins"
tmux start-server # start a server but don't attach to it
tmux new-session -d # create a new session but don't attach to it either
~/.tmux/plugins/tpm/scripts/install_plugins.sh # install the plugins
tmux kill-server # killing the server is not required, I guess

seperate
echo "Rebuild bats cache and activate its theme"
bat cache --build
