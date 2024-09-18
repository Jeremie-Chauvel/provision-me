#!/usr/bin/env bash
# this script install atuin

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist atuin

sudo apt install --yes curl
# atuin binary
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/atuinsh/atuin/releases/latest/download/atuin-installer.sh >./atuin-installer.sh

sh ./atuin-installer.sh --no-modify-path

mv ~/.atuin/bin/atuin ~/.local/bin/

rm -f ./atuin-installer.sh
~/.local/bin/atuin import zsh
