#!/usr/bin/env bash
# install fnm a node version manager (faster than nvm)
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist fnm

sudo pacman --needed --noconfirm -S curl

curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
