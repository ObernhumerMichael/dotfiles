#!/bin/bash

echo "Enabling SDDM Theme"
echo "[Theme]
Current=catppuccin-mocha" | sudo tee /etc/sddm.conf > /dev/null
