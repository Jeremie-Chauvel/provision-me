#!/usr/bin/env bash
# this script install bat (replacement for cat)
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y bat

if [[ ! -f ~/.local/bin/bat ]]; then
  mkdir -p ~/.local/bin
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi
