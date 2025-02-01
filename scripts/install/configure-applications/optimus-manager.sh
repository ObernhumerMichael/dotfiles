#!/bin/bash

echo "Configure optimus-manager"
DOTFILES_DIR=$1
CONF="$DOTFILES_DIR/other/optimus-manager.conf"
sudo cp $CONF /etc/optimus-manager/optimus-manager.conf
