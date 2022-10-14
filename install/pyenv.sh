#!/usr/bin/env bash
# Install pyenv
set -euo pipefail
IFS=$'\n\t'

echo 'broken use the classic pyenv install'
exit 1
sudo apt install --yes curl

bash -c "$(curl -sSL https://raw.githubusercontent.com/Jeremie-Chauvel/pyenv/master/install.sh)"
