#!/usr/bin/env bash
# install gimp an image editor
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes gimp

# Add shortcut icons to desktop
cp /usr/share/applications/gimp.desktop "$HOME/Desktop/gimp.desktop"
chmod +x "$HOME/Desktop/gimp.desktop"
