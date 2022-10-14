#!/usr/bin/env bash
# this script install delta

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist delta

sudo apt install --yes curl

readonly delta_downloads_urls=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | jq '.assets | map(.browser_download_url)')
readonly delta_deb_download_url=$(echo "$delta_downloads_urls" | awk '/deb/ {print $1}' | awk '/amd/ {print $1}' | awk '/delta_/ {print $1}' | sed -e 's/"//g' -e 's/,//g')
curl -o ./delta.deb -L "$delta_deb_download_url"
sudo apt install ./delta.deb --yes
rm ./delta.deb
