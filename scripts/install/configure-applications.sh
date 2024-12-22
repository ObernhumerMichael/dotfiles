#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CONFIGS="$DOTFILES_DIR/scripts/install/configure-applications"

seperate() {
    echo
    printf '%*s\n' "$(tput cols)" '' | tr ' ' '#'
    echo
}

$CONFIGS/grub.sh

seperate

$CONFIGS/sddm.sh

seperate

$CONFIGS/thunderbird.sh $DOTFILES_DIR

seperate

$CONFIGS/tmux.sh

seperate

$CONFIGS/bat.sh

seperate

$CONFIGS/btop.sh

seperate

$CONFIGS/libreoffice.sh

seperate

$CONFIGS/gwenview.sh
