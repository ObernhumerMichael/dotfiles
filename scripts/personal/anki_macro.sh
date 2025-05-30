#!/bin/bash

if ! command -v ydotool &> /dev/null; then
    echo "Error: ydotool is not installed."
    exit 1
fi

count=1

# Function to display help
function show_help() {
    echo "Usage: $0 [-n <count>] [--help]"
    echo ""
    echo "Options:"
    echo "  -n <count>   Specify how many times to repeat the script"
    echo "  --help       Show this help message"
}

../../hypr/scripts/gamemode.sh

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -n)
            count=$2
            shift 2
            ;;
        --help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

switch_workspace() {
    hyprctl dispatch workspace "$1"
    sleep 0.3
}

copy_question() {
  ydotool type '@q'
   sleep 0.15
}

copy_answer() {
  ydotool type '@a'
   sleep 0.15
}

paste_clip() {
    ydotool key 29:1 47:1 29:0 47:0 # CTRL+v
     sleep 0.15
}

press_tab() {
  ydotool key 15:1 15:0 # TAB
   sleep 0.15
}

save_card() {
    ydotool key 29:1 28:1 29:0 28:0 # CTRL+ENTER
     sleep 0.15
}

for ((i = 0; i < count; i++)); do
  switch_workspace 1
  copy_question
  switch_workspace 2
  paste_clip
  press_tab
  switch_workspace 1
  copy_answer
  switch_workspace 2
  paste_clip
  save_card
done


../../hypr/scripts/gamemode.sh
