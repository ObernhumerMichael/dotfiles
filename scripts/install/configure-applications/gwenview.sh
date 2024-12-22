#!/bin/bash

echo "Set gwenview to the current theme with UI fixes"
GWENVIEW_DESKTOP_ENTRY="/usr/share/applications/org.kde.gwenview.desktop"
GWENVIEWRC="$HOME/.config/gwenviewrc"
BackgroundColorMode="$(grep 'BackgroundColorMode=DocumentView::Light' $GWENVIEWRC)"

if [[ -z $BackgroundColorMode ]]; then
    sed -i '/\[General\]/a BackgroundColorMode=DocumentView::Light' "$GWENVIEWRC"
fi

sudo sed -i "s|Exec=gwenview.*|Exec=gwenview -stylesheet $HOME/.config/qt6ct/qss/gwenview-style.qss %U|" "$GWENVIEW_DESKTOP_ENTRY"
