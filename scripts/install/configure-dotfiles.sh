#!/bin/bash

# Fetch/update the submodules to the commit referenced in the main repository
git submodule update --init --recursive

# Fetch the SDDM theme
cd /tmp/
wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip
unzip catppuccin-mocha.zip
rm catppuccin-mocha.zip

sudo rm -rf /usr/share/sddm/themes/catppuccin-mocha
sudo mv ./catppuccin-mocha /usr/share/sddm/themes/


