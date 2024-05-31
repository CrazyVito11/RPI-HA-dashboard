#!/bin/bash

set -e

# Get the path to the script, this way it we should always point to the correct directory
SCRIPT_DIR=$(dirname "$0")

# Load our .env file
source "$SCRIPT_DIR/.env"

firefox --new-window "$HA_DASHBOARD_URL" & (
    sleep 10;
    echo key f11 | dotool;
    echo mouseto 1 1 | dotool
)
