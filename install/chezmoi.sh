#!/usr/bin/env bash
# install chezmoi, if a repository is passed as argument apply chezmoi dotfiles as well
# usage: ./install-chezmoi.sh git@github.com:Jeremie-Chauvel/chezmoi.git
set -eo pipefail
IFS=$'\n\t'

readonly chezmoi_repository=$1
set -u

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist chezmoi

readonly chezmoi_install_dir="$HOME/.local/bin"
sudo apt install --yes curl

if [[ ! -f ~/.local/bin ]]; then
  mkdir -p ~/.local/bin
fi
# install and init chezmoi using your dotfile
if [ -n "$chezmoi_repository" ]; then
  sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$chezmoi_install_dir" init --apply $chezmoi_repository
else
  # install chezmoi
  sh -c "$(curl -fsLS get.chezmoi.io)"
fi
