#!/usr/bin/env bash
# This script install direnv
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes curl

installer_name="direnv-installer.sh"
curl -sfL https://direnv.net/install.sh >"$installer_name"
chmod +x "$installer_name"
bin_path="$HOME/.local/bin" bash "$installer_name"
rm "$installer_name"
