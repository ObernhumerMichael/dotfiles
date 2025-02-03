#!/bin/bash

# Get current optimus mode
mode=$(optimus-manager --print-mode | awk -F ' : ' '{print $2}')


# Check if we're in NVIDIA mode
if [[ "$mode" == "nvidia" ]]; then
    # Set the environment variables for NVIDIA
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
fi

# Launch Hyprland
exec Hyprland
