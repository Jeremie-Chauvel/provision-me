#!/usr/bin/env bash
# Light is A program to control backlights https://github.com/haikarainen/light
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist light

tmp_dir=$(mktemp -d -t light-install-XXXX)
cd "$tmp_dir"
git clone https://github.com/haikarainen/light.git
cd light

set +eu
./autogen.sh
./configure && make
sudo make install
set -eu
sudo usermod -a -G video $USER
cd -
rm -rf "$tmp_dir"
