#!/usr/bin/env bash
# This script install nix package manager
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes curl

set +eu
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
set -eu
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix >nix-installer.sh
chmod +x nix-installer.sh
sudo ./nix-installer.sh install
rm nix-installer.sh
