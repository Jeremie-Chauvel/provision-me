#!/usr/bin/env bash
# install xclip, a tool to copy a command from a pipe or file from cli
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes xclip
