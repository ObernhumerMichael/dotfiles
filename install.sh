#!/bin/bash

seperate() {
    echo
    printf '%*s\n' "$(tput cols)" '' | tr ' ' '#'
    echo
}

if ! command -v paru &>/dev/null; then
    echo "paru is required but not installed."
    echo "Install paru or use an other AUR helper and change it /scripts/install/install-dependencies.sh!"
    exit 1
fi

echo "\n"
echo "Install dependencies:"
seperate
./scripts/install/install-dependencies.sh

echo "\n"
echo "Configure dotiles:"
seperate
./scripts/install/configure-dotfiles.sh

echo "\n"
echo "Create symlinks from the repo to the required destinations:"
seperate
./scripts/install/symlink-dotfiles.sh


echo "\n"
echo "Configure applications:"
seperate
./scripts/install/configure-applications.sh

echo "\n"
echo If you are using Nvidia please check out the official hyprland docs on how to use Nvidia!
