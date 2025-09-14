#!/usr/bin/env bash
# this script install atuin

set -euo pipefail
IFS=$'\n\t'

sudo pacman --needed --noconfirm -S atuin
