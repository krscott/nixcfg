#!/usr/bin/env bash

# exit when any command fails
set -euo pipefail
shopt -s failglob

xinput --map-to-output 'WaveShare WS170120' 'HDMI-0'
