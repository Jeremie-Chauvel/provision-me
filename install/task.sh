#!/usr/bin/env bash
# install task a replacement for make https://taskfile.dev/
set -euox pipefail
IFS=$'\n\t'

sudo apt install --yes curl

set +e
hash _task 2>/dev/null
result_status="$?"
set -e
if [[ "$result_status" -eq '1' ]]; then
  # task completion not found, install task completion
  curl -L https://raw.githubusercontent.com/go-task/task/master/completion/zsh/_task -o _task
  chmod +x _task
  sudo mv _task /usr/share/zsh/functions/Completion/Unix/
fi

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist task

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
