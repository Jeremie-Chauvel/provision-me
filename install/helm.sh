#!/usr/bin/env bash
# this script install helm (package manager for Kubernetes)

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist helm

sudo apt install --yes make

set +e
hash go 2>/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  echo "'go' is not available in path"
  exit 1
fi

readonly tmp_dir="$(mktemp -d -t helm-install-XXXX)"
cd "$tmp_dir"
git clone --depth 1 https://github.com/helm/helm.git
cd helm
make
mkdir -p ~/.local/bin
mv ./bin/helm ~/.local/bin/helm
cd ~
rm -rf "$tmp_dir"
