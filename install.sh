#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "The script is NOT running as root. Please run as root."
    exit 1
fi

if ! command -v paru &>/dev/null; then
    echo "paru is required but not installed."
    echo "Install paru or use an other AUR helper and change it /scripts/install/install-dependencies.sh!"
    exit 1
fi

echo "Install dependencies:"
./scripts/install/install-dependencies.sh
echo "\n"

echo "Configure dotiles:"
./scripts/install/configure-dotfiles.sh
echo "\n"

echo "Create symlinks from the repo to the required destinations:"
./scripts/install/symlink-dotfiles.sh
echo "\n"

echo "Configure applications:"
./scripts/install/configure-applications.sh
echo "\n"

echo If you are using Nvidia please check out the official hyprland docs on how to use Nvidia!
