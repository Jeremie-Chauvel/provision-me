#!/usr/bin/env bash
# This script install shellcheck (linter for shell)
set -euo pipefail
IFS=$'\n\t'

sudo snap install shellcheck
