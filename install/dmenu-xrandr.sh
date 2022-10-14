#!/usr/bin/env bash
# Install dmenu-xrandr
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist dmenu-xrandr

tmp_dir=$(mktemp -d -t dmenu-xrandr-XXXX)
cd "$tmp_dir"
git clone https://github.com/clementhannicq/dmenu-xrandr.git
cd dmenu-xrandr
set +e

set +e
hash pyenv 2>/dev/null
result_status="$?"
set -e
if [ "$result_status" -gt 0 ]; then
  echo 'pyenv is not installed'
  exit 1

fi
set +e
hash pipenv 2>/dev/null
result_status="$?"
set -e
if [ "$result_status" -gt 0 ]; then
  echo 'pipenv is not installed'
  exit 1

fi
pyenv versions | grep -e '3.6.2' -q
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  CONFIGURE_OPTS=--enable-shared pyenv install 3.6.2
fi
pipenv install
pipenv run 'make build'
mkdir -p ~/.local/bin
mv ./dist/main ~/.local/bin/dmenu-xrandr
cd
rm -rf "$tmp_dir"
