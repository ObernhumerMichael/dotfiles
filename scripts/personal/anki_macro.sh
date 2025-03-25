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
}

copy_answer() {
  ydotool type '@a'
}

paste_clip() {
    ydotool key 29:1 47:1 29:0 47:0 # CTRL+v
}

press_tab() {
  ydotool key 15:1 15:0 # TAB
}

save_card() {
    ydotool key 29:1 28:1 29:0 28:0 # CTRL+ENTER
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
