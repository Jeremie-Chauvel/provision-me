#!/usr/bin/env bash
# This script install insomnia
set -euo pipefail
IFS=$'\n\t'

nix-env -iA nixpkgs.insomnia
# not required if you: add the following to your ~/.profile (you may have to restart afterwards): export XDG_DATA_DIRS="/home/your_user/.nix-profile/share:$XDG_DATA_DIRS"
# cp ~/.nix-profile/share/applications/insomnia.desktop ~/.local/share/applications/
