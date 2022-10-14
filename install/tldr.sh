#!/usr/bin/env bash
# install tldr
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist tldr

sudo apt install --yes curl

if [ ! -f ~/.local/bin ]; then
  mkdir -p ~/.local/bin
fi
curl -o ~/.local/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/.local/bin/tldr
