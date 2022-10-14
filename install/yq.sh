#!/usr/bin/env bash
# this script install yq a yaml parser

set -euo pipefail
IFS=$'\n\t'
# https://github.com/mikefarah/yq/releases/tag/v4.27.5
# https://github.com/mikefarah/yq/releases/download/v4.27.5/yq_linux_amd64
SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist yq

sudo apt install --yes curl
curl -Lk https://github.com/mikefarah/yq/releases/download/v4.27.5/yq_linux_amd64 >~/yq
sudo mv ~/yq /usr/local/bin/yq
sudo chmod +x /usr/local/bin/yq
