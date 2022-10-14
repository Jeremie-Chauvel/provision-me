#!/usr/bin/env bash
# This script install php
set -euo pipefail
IFS=$'\n\t'

echo 'deprecated installer needs to be updated'
exit 1

sudo apt install -y php-common php7.2 php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline php7.2-xml
