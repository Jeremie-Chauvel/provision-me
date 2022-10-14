#!/usr/bin/env bash
# this script install lens

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist kontena-lens

sudo apt install --yes curl

readonly lens_downloads_urls=$(curl -s https://api.github.com/repos/lensapp/lens/releases/latest | jq '.assets | map(.browser_download_url)')
readonly lens_deb_download_url=$(echo "$lens_downloads_urls" | awk '/deb/ {print $1}' | sed -e 's/"//g' -e 's/,//g')
curl -o ./lens.deb -L "$lens_deb_download_url"
sudo apt install ./lens.deb --yes
rm ./lens.deb
