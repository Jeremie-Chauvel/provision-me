#!/usr/bin/env bash
# This script install kitty a gpu based terminal (it's fast, simple and easily scriptable)
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist kitty

sudo apt install --yes curl

readonly kitty_installer_name=kitty-installer.sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh -o "$kitty_installer_name" | bash
sudo ln -sr $HOME/.local/kitty.app/bin/kitty /usr/local/bin/kitty
