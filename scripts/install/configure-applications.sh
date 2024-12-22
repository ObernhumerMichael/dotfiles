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

seperate

echo "Configure and theme btop"
BTOP_CONFIG="$HOME/.config/btop"
sed -i "s|color_theme.*|color_theme = $BTOP_CONFIG/themes/dotfiles.theme|" "$BTOP_CONFIG/btop.conf"
sed -i "s/vim_keys = False/vim_keys = True/" "$BTOP_CONFIG/btop.conf"

seperate

echo "Set LibreOffice to dark mode"
LIBREOFFICE_CONFIG="$HOME/.config/libreoffice/4/user/registrymodifications.xcu"
AppearanceConf="$(grep '<item oor:path="/org.openoffice.Office.Common/Misc"><prop oor:name="Appearance" oor:op="fuse">' $LIBREOFFICE_CONFIG)"
if [[ -n $AppearanceConf ]]; then
    # Set to dark mode
    sed -i 's|<item oor:path="/org.openoffice.Office.Common/Misc"><prop oor:name="Appearance" oor:op="fuse"><value>.</value></prop></item>|<item oor:path="/org.openoffice.Office.Common/Misc"><prop oor:name="Appearance" oor:op="fuse"><value>2</value></prop></item>|' $LIBREOFFICE_CONFIG
else
    # Add Apperance config line + set to dark mode
    sed -i '$i<item oor:path="/org.openoffice.Office.Common/Misc"><prop oor:name="Appearance" oor:op="fuse"><value>2</value></prop></item>' $LIBREOFFICE_CONFIG
fi

seperate

echo "Set gwenview to the current theme with UI fixes"
GWENVIEW_DESKTOP_ENTRY="/usr/share/applications/org.kde.gwenview.desktop"
GWENVIEWRC="$HOME/.config/gwenviewrc"
BackgroundColorMode="$(grep 'BackgroundColorMode=DocumentView::Light' $GWENVIEWRC)"

if [[ -z $BackgroundColorMode ]]; then
    sed -i '/\[General\]/a BackgroundColorMode=DocumentView::Light' "$GWENVIEWRC"
fi

sudo sed -i "s|Exec=gwenview %U|Exec=gwenview -stylesheet $DOTFILES_DIR/qt/qt6ct/qss/gwenview-style.qss %U|" "$GWENVIEW_DESKTOP_ENTRY"
