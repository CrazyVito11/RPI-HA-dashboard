#!/bin/bash

set -e
source .env

firefox --new-window "$HA_DASHBOARD_URL" & (
    sleep 10;
    echo key f11 | dotool;
    echo mouseto 1 1 | dotool
)
