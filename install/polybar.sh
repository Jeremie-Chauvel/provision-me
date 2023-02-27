#!/usr/bin/env bash
# this script install polybar compiling it from source

set -euo pipefail
IFS=$'\n\t'

nix-env -iA nixpkgs.polybarFull
