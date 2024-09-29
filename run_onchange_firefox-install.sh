#!/bin/bash

# Function to check if a PPA is already added
is_ppa_installed() {
    grep -h "^deb .*$1" /etc/apt/sources.list.d/* > /dev/null 2>&1
}

# Function to check if Firefox ESR is already installed
is_firefox_esr_installed() {
    dpkg -l | grep firefox-esr > /dev/null 2>&1
}

# Update package list
echo "## firefox-esr updating package list..."
sudo apt update

# Install prerequisites for adding a PPA
echo "## Installing prerequisites..."
sudo apt install -y software-properties-common

# Check if the Mozilla PPA is already added
PPA="ppa:mozillateam/ppa"
if is_ppa_installed "$PPA"; then
    echo "## Mozilla PPA is already added."
else
    # Add the PPA for Firefox ESR
    echo "## Adding Firefox ESR PPA..."
    sudo add-apt-repository -y "$PPA"

    # Pin the Firefox ESR package to give it priority
    echo "Pinning Firefox ESR to priority..."
    echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
fi

# Update package list again after adding PPA
echo "## Updating package list..."
sudo apt update

# Check if Firefox ESR is already installed
if is_firefox_esr_installed; then
    echo "## Firefox ESR is already installed. Updating it..."
    sudo apt upgrade -y firefox-esr
else
    # Install Firefox ESR
    echo "## Installing Firefox ESR..."
    sudo apt install -y firefox-esr
fi

# Confirm installation or update
echo "## Firefox ESR installation/update complete!"
firefox-esr --version