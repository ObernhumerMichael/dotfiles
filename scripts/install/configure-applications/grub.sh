#!/bin/bash

echo "Theming Grub"
sudo sed -i '/GRUB_THEME/c\GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
