#!/usr/bin/env bash
# install jless, a nicer json viewer tool
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist jless

set +e
is_command "cargo"
result_status="$?"
set -e
if [ "$result_status" -gt '0' ]; then
  echo "'cargo' not found, it's required to install jless"
  echo "You can install it using:"
  echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
  exit 1

fi

sudo apt-get install libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev

cargo install jless
