#!/usr/bin/env bash
# This script install and configure terminator
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y terminator
# TODO create profile and set fonts

# TODO make terminator the default terminal

# Add shortcut icons to desktop
cp /usr/share/applications/terminator.desktop ~/Desktop/
chmod +x ~/Desktop/terminator.desktop
