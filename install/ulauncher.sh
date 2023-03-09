#!/usr/bin/env bash
# install ulauncher a command launcher
set -euo pipefail
IFS=$'\n\t'

# nix-env -iA nixpkgs.wmctrl

sudo apt install --yes curl
readonly ulauncher_downloads_urls=$(curl -s https://api.github.com/repos/Ulauncher/Ulauncher/releases/latest | jq '.assets | map(.browser_download_url)')
readonly ulauncher_deb_download_url=$(echo "$ulauncher_downloads_urls" | awk '/deb/ {print $1}' | sed -e 's/"//g' -e 's/,//g')
curl -o ./ulauncher.deb -L "$ulauncher_deb_download_url"
sudo apt install ./ulauncher.deb --yes
rm ./ulauncher.deb
