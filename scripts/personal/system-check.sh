#!/bin/bash

# Define log files
CLAMAV_LOG="/tmp/clamav_scan.log"
RKHUNTER_LOG="/tmp/rkhunter_scan.log"

# Function to print messages with color
info() { echo -e "\e[34m[INFO]\e[0m $1"; }
warning() { echo -e "\e[33m[WARNING]\e[0m $1"; }
error() { echo -e "\e[31m[ERROR]\e[0m $1"; }

info "Updating ClamAV database..."
sudo freshclam

info "Scanning system with ClamAV..."
sudo clamscan -ro --bell --log=$CLAMAV_LOG /

# Check ClamAV results
if grep -q "Infected files: 0" "$CLAMAV_LOG"; then
    info "No viruses found by ClamAV."
else
    warning "Potential threats detected by ClamAV! Check $CLAMAV_LOG"
fi

info "Updating rkhunter..."
sudo rkhunter --update

info "Running rkhunter scan..."
sudo rkhunter --check --sk --logfile $RKHUNTER_LOG

# Check rkhunter results
if grep -q "System checks summary" "$RKHUNTER_LOG" && grep -q "No warnings found" "$RKHUNTER_LOG"; then
    info "No rootkits found by rkhunter."
else
    warning "Possible rootkits detected! Review $RKHUNTER_LOG"
fi

info "Scan completed."
