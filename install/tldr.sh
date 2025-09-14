#!/usr/bin/env bash
# install tldr
set -euo pipefail
IFS=$'\n\t'

sudo pacman --needed --noconfirm -S tldr
tldr --update
