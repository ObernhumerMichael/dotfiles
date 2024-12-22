#!/bin/bash

echo "Install tmux plugins"
tmux start-server # start a server but don't attach to it
tmux new-session -d # create a new session but don't attach to it either
~/.tmux/plugins/tpm/scripts/install_plugins.sh # install the plugins
tmux kill-server # killing the server is not required, I guess
