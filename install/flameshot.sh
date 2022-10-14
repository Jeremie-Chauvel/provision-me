#!/usr/bin/env bash
# install flameshot a screenshot capture tool
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes flameshot

# shotcut to setup in your dotfiles:
# flameshot gui
# eg for i3: `bindsym Print exec flameshot gui``
