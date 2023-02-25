#!/usr/bin/env bash
# This script install kitty a gpu based terminal (it's fast, simple and easily scriptable)
set -euo pipefail
IFS=$'\n\t'

if [ -e '/usr/local/bin/kitty' ]; then
  exit 0
fi

sudo apt install --yes curl

readonly kitty_installer_name=kitty-installer.sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh -o "$kitty_installer_name" | bash
sudo ln -sr $HOME/.local/kitty.app/bin/kitty /usr/local/bin/kitty
