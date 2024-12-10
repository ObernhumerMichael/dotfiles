#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
THEME_NAME="mocha-mauve"
THEME_FILE="$DOTFILES_DIR/thunderbird/catppuccin/themes/mocha/$THEME_NAME.xpi"
if [ ! -f "$THEME_FILE" ]; then
    echo "Theme file $THEME_FILE not found!"
    exit 1
fi
THEME_ID="$(cat $THEME_FILE | grep -a '"id"' | grep -o "{.*}" | tr -d '{}')"
SYMLINK_FILENAME="{$THEME_ID}.xpi"

THUNDERBIRD_DIR="$HOME/.thunderbird"
PROFILE_DIR="$THUNDERBIRD_DIR/$(ls $THUNDERBIRD_DIR | grep "default-release")"
if [ -z "$PROFILE_DIR" ]; then
    echo "No Thunderbird profile found."
    exit 1
fi
echo "Using Thunderbird profile: $PROFILE_DIR"
EXTENSIONS_DIR="$PROFILE_DIR/extensions"
PREFS_FILE="$PROFILE_DIR/prefs.js"

# Symlink the thunderbird theme
mkdir -p "$EXTENSIONS_DIR" # Ensure the extensions directory exists
ln -sf $THEME_FILE $EXTENSIONS_DIR/$SYMLINK_FILENAME
echo "Symlinked $THEME_NAME thunderbird theme."
