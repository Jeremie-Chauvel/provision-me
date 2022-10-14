#!/usr/bin/env bash
# here, I only install slack
set -euo pipefail
IFS=$'\n\t'
echo 'Slack snap seems broken for now'
exit 1

sudo snap install slack --classic
