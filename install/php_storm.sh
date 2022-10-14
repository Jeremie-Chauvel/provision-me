#!/usr/bin/env bash
# This script install and configure phpStorm
set -euo pipefail
IFS=$'\n\t'

sudo apt install -y jq curl
sudo snap install phpstorm --classic

readonly PLUGINS_IDS=(
  8575  # NyanProgressBar
  10037 # csv plugin
  6884  # handlebars (twig)
  7294  # editor config
  9333  # makefile support
  9792  # key promoter x
  7320  # php annotations
  7219  # Symfony support
  2162  # string manipulation
)

# find phpStorm settings directory
for f in $HOME/.PhpStorm*; do
  phpStormDirectory="$f"
done
# check phpStorm dir is available
if [ -d "$phpStormDirectory" ]; then
  if [ ! -d "$phpStormDirectory/config/plugins" ]; then
    if [ -f "$phpStormDirectory/config/plugins" ]; then
      rm "$phpStormDirectory/config/plugins"
    fi
    mkdir "$phpStormDirectory/config/plugins"
  fi
  # install plugins
  for pluginId in "${PLUGINS_IDS[@]}"; do
    set +e
    file=$(curl https://plugins.jetbrains.com/api/plugins/${pluginId}/updates | jq -r '.[0].file')
    fileName=$(basename ${file})
    curl https://plugins.jetbrains.com/files/${file} -O
    if [ "${file: -4}" == ".zip" ]; then
      extractedDir=$(unzip -qql $fileName | head -n1 | tr -s ' ' | cut -d' ' -f5-)
      unzip -qq $fileName
      rm $fileName
      mv $extractedDir ${phpStormDirectory}/config/plugins
      # in case we couldn't move the directory
      if [ -d "$extractedDir" ]; then
        rm -rf $extractedDir
      fi
    else
      mv "$fileName" ${phpStormDirectory}/config/plugins
    fi
    set -e
  done
fi
