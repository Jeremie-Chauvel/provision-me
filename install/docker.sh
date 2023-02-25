#!/usr/bin/env bash
# Install docker
set -euo pipefail
IFS=$'\n\t'

set +e
hash docker 2>/dev/null
result_status="$?"
set -e
if [ "$result_status" -gt 0 ]; then
  sudo apt install --yes curl
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo bash get-docker.sh
  rm get-docker.sh
  sudo usermod -aG docker $USER
  sudo docker system prune -af
fi
# install docker-compose (as a plugin for docker)
set +e
hash docker-compose 2>/dev/null
result_status="$?"
set -e
if [ "$result_status" -gt 0 ]; then
  sudo apt install --yes docker-compose-plugin curl
  curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh -o install_on_linux.sh
  sudo bash install_on_linux.sh
  rm install_on_linux.sh
fi
