#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

readonly jenv_install_dir="$HOME/.jenv"

if [[ -e "${jenv_install_dir}/bin" ]]; then
  exit 0
fi
git clone --depth 1 https://github.com/jenv/jenv.git "$jenv_install_dir"
