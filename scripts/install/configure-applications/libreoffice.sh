#!/bin/bash

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
