#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CONFIG_FILE="$DOTFILES_DIR/dotfiles.json"

# Check if jq is installed for parsing JSON
if ! command -v jq &>/dev/null; then
    echo "jq is required but not installed. Please install it."
    exit 1
fi

# Read and parse the JSON file
if [[ -f "$CONFIG_FILE" ]]; then
    # Loop through each key-value pair in the JSON file
    jq -r 'to_entries[] | "\(.key) \(.value)"' "$CONFIG_FILE" | while read -r src dest; do
        # Expand ~ to $HOME in destination path
        dest="${dest/#\~/$HOME}"

        # Check if the target already exists
        if [[ -L "$dest" || -e "$dest" ]]; then
            echo "Warning: $dest already exists."
            read -p "Do you want to overwrite it? (y/N): " answer < /dev/tty
            if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
                rm -rf "$dest"
                echo "Removed existing $dest"
            else
                echo "Skipping $dest"
                continue
            fi
        fi

        # Create the destination directory's parent if it doesn't exist
        echo "$(dirname "$dest")"
        mkdir -p "$(dirname "$dest")"

        # Create a symlink for the target
        ln -s "$DOTFILES_DIR/$src" "$dest"
        if [[ $? -ne 0 ]]; then
            echo "Failed to create symlink. Attempting with sudo..."
            sudo ln -s "$DOTFILES_DIR/$src" "$dest"
            if [[ $? -ne 0 ]]; then
              echo "Failed to create symlink even with sudo."
              exit 1
            fi
            echo "Symlink created: $DOTFILES_DIR/$src -> $dest"
        else
          echo "Symlink created: $DOTFILES_DIR/$src -> $dest"
        fi

    done
else
    echo "Config file $CONFIG_FILE not found."
    exit 1
fi
