#!/usr/bin/env bash
# install ulauncher a command launcher
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist ulauncher

sudo apt install --yes curl
readonly ulauncher_downloads_urls=$(curl -s https://api.github.com/repos/Ulauncher/Ulauncher/releases/latest | jq '.assets | map(.browser_download_url)')
readonly ulauncher_deb_download_url=$(echo "$ulauncher_downloads_urls" | awk '/deb/ {print $1}' | sed -e 's/"//g' -e 's/,//g')
curl -o ./ulauncher.deb -L "$ulauncher_deb_download_url"
sudo apt install ./ulauncher.deb --yes
rm ./ulauncher.deb
