#!/bin/bash

echo "Configure and theme btop"
BTOP_CONFIG="$HOME/.config/btop"
sed -i "s|color_theme.*|color_theme = $BTOP_CONFIG/themes/dotfiles.theme|" "$BTOP_CONFIG/btop.conf"
sed -i "s/vim_keys = False/vim_keys = True/" "$BTOP_CONFIG/btop.conf"
