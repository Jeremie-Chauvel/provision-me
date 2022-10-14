#!/usr/bin/env bash
# This script install and configure vscode
set -euo pipefail
IFS=$'\n\t'

# in case vscode is not installed using snap
SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist code

sudo snap install code --classic

echo 'sync all your extensions and settings using vscode built in sync feature'
echo 'https://code.visualstudio.com/docs/editor/settings-sync'
