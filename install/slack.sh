#!/usr/bin/env bash
# here, I only install slack
set -euo pipefail
IFS=$'\n\t'

export NIXPKGS_ALLOW_UNFREE=1
nix-env -iA nixpkgs.slack

# not required if you: add the following to your ~/.profile (you may have to restart afterwards): export XDG_DATA_DIRS="/home/your_user/.nix-profile/share:$XDG_DATA_DIRS"
# cp ~/.nix-profile/share/applications/slack.desktop ~/.local/share/applications/
