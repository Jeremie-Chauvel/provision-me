#!/usr/bin/env bash
# install chezmoi, if a repository is passed as argument apply chezmoi dotfiles as well
# usage: ./install-chezmoi.sh git@github.com:Jeremie-Chauvel/chezmoi.git
set -eo pipefail
IFS=$'\n\t'

set -u

brew install chezmoi

chezmoi_template="$HOME/.config/chezmoi/chezmoi.toml"
if [ ! -f "$chezmoi_template" ]; then
  mkdir -p ~/.config/chezmoi
  echo -e "[data.git]
      gpg_signingkey='~/.ssh/id_ed25519'
      gpg_format='ssh'
  " >"$chezmoi_template"
  chezmoi init --apply git@github.com:Jeremie-Chauvel/chezmoi.git --branch bluefin
fi
