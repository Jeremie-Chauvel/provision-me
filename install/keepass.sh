#!/usr/bin/env bash
# This script install keepass a vault like tool for secrets
set -euo pipefail
IFS=$'\n\t'

sudo snap install keepassxc
