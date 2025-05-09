#!/usr/bin/env bash
# install tldr
set -euo pipefail
IFS=$'\n\t'

brew install tealdeer
tldr --update
