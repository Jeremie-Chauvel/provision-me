#!/usr/bin/env bash
# this script install azure cli

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist az

sudo apt install --yes curl

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
