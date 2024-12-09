#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
THEME="$DOTFILES_DIR/thunderbird/catppuccin/themes/mocha/mocha-mauve.xpi"

THUNDERBIRD_DIR="$HOME/.thunderbird"
THUNDERBIRD_RELEASE=$(ls $THUNDERBIRD_DIR | grep release)
THUNDERBIRD_EXTENSIONS_DIR="$THUNDERBIRD_DIR/$THUNDERBIRD_RELEASE/extensions"

# Symlink the thunderbird theme
THEME_ID_FILENAME="$(cat $THEME | grep -a '"id"' | grep -o "{.*}").xpi"
ln -sf $THEME $THUNDERBIRD_EXTENSIONS_DIR/$THEME_ID_FILENAME
