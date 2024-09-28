#!/bin/bash

# Define the file and the desired setting
KEYBOARD_FILE="/etc/default/keyboard"
DESIRED_OPTION="XKBOPTIONS=\"caps:escape\""

# Check if the file exists
if [[ ! -f "$KEYBOARD_FILE" ]]; then
    echo "Error: $KEYBOARD_FILE does not exist."
    exit 1
fi

# Check if XKBOPTIONS is already set to caps:escape
if grep -q 'XKBOPTIONS="caps:escape"' "$KEYBOARD_FILE"; then
    echo "XKBOPTIONS is already set to caps:escape."
else
    # Backup the original file
    sudo cp "$KEYBOARD_FILE" "$KEYBOARD_FILE.bak"

    # Set the XKBOPTIONS to caps:escape
    echo "Setting XKBOPTIONS to caps:escape..."
    sudo sed -i "s/^XKBOPTIONS=.*/$DESIRED_OPTION/" "$KEYBOARD_FILE"

    # If the line does not exist, append it
    if ! grep -q '^XKBOPTIONS=' "$KEYBOARD_FILE"; then
        echo "$DESIRED_OPTION" | sudo tee -a "$KEYBOARD_FILE" > /dev/null
    fi

    echo "XKBOPTIONS has been set to caps:escape. Please restart your session for changes to take effect."
fi
