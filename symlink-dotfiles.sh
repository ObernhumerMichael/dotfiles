#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
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
        mkdir -p "$(dirname "$dest")"

        # Check if the source is a directory
        if [[ -d "$DOTFILES_DIR/$src" ]]; then
            # Create a symlink for the entire directory
            ln -s "$DOTFILES_DIR/$src" "$dest"
            echo "Linked directory $DOTFILES_DIR/$src to $dest"
        else
            # Create a symlink for an individual file
            ln -s "$DOTFILES_DIR/$src" "$dest"
            echo "Linked file $DOTFILES_DIR/$src to $dest"
        fi
    done
else
    echo "Config file $CONFIG_FILE not found."
    exit 1
fi
