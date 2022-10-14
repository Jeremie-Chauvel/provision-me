#!/usr/bin/env bash
# This script install and configure aws
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist aws

python3 -m pip install awscli --upgrade --user
if [ ! -d ~/.aws ]; then
    mkdir ~/.aws
fi
