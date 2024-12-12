#!/usr/bin/env bash
# install httpie, a nicer curl like tool
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist http

curl -SsL https://packages.httpie.io/deb/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/httpie.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/httpie.gpg] https://packages.httpie.io/deb ./" | sudo tee /etc/apt/sources.list.d/httpie.list >/dev/null
sudo apt update
sudo apt install --yes httpie
