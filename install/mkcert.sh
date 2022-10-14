#!/usr/bin/env bash
# install mkcert a program to create self-signed certificates (for dev https)
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist mkcert

sudo apt install --yes libnss3-tools

set +e
hash go 2>/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  echo "'go' is not available in path"
  exit 1
fi

readonly tmp_dir="$(mktemp -d -t mkcert-install-XXXX)"
cd "$tmp_dir"
git clone https://github.com/FiloSottile/mkcert && cd mkcert
go build -ldflags "-X main.Version=$(git describe --tags)"
mkdir -p ~/.local/bin
mv ./mkcert ~/.local/bin/mkcert
cd ~
rm -rf "$tmp_dir"
