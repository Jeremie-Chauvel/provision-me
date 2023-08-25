#!/usr/bin/env bash
# install lazydocker a gui to monitor docker containers
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist lazydocker

sudo apt install -y curl

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
