#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist go

sudo apt install --yes curl

readonly tmp_dir=$(mktemp -d)
cd "$tmp_dir"
curl -LO https://get.golang.org/Linux/go_installer
chmod +x go_installer
./go_installer
cd -
rm -rf "$tmp_dir"

export GOPATH=$HOME/go
export PATH="~/.go/bin:$PATH"
export PATH="~/go/bin:$PATH"
