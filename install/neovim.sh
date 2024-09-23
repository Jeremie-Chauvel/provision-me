#!/usr/bin/env bash
# This script install neovim
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes curl

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
