#!/usr/bin/env bash
# This script install kitty a gpu based terminal (it's fast, simple and easily scriptable)
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes curl

set +eu
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
set -eu

sudo ln -sr ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
