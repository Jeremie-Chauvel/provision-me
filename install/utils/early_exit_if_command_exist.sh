#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/is_command.sh"

early_exit_if_command_exist() {
  set +u
  local readonly command_name="$1"
  set -u
  set +e
  is_command "$command_name"
  result_status="$?"
  set -e
  if [ "$result_status" -eq '0' ]; then
    echo "command $command_name found"
    exit 0

  fi
}
