#!/usr/bin/env bash
# here, I only install easy to install packages and update packages index
set -euo pipefail
IFS=$'\n\t'

sudo pacman --needed --noconfirm -S direnv ripgrep \
  fzf fd yq github-cli neovim lazygit lazydocker \
  git-absorb httpie git-delta bat eza zoxide zsh

# sudo apt update
# # generic
# sudo apt install --yes git nala curl wget make htop tree libpng-dev \
#   resolvconf python3-pip jq gnupg2 fd-find ripgrep git-absorb

# # TODO test if this is still needed
# sudo apt install --yes fonts-noto-color-emoji
