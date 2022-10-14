#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist pipenv
sudo apt install --yes python3-pip python3-venv python3-dev
sudo apt install --yes --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

pip3 install --user pipx
export PATH="$HOME/.local/bin:$PATH"

pipx install pipenv

set +eu
bash -c "$(curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer)"
set -eu

export PATH="$HOME/.pyenv/bin:$PATH"
set +eu
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
set -eu
