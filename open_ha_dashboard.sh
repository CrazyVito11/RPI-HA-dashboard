#!/bin/bash

set -e

# Get the path to the script, this way it we should always point to the correct directory
SCRIPT_DIR=$(dirname "$0")

# Load our .env file
source "$SCRIPT_DIR/.env"

# Wait for the specified startup delay
sleep $BROWSER_STARTUP_DELAY;

chromium-browser --new-window "$HA_DASHBOARD_URL" & (
    sleep $KEY_INPUT_DELAY;
    echo key f11 | dotool;
    echo mouseto 1 1 | dotool
)
