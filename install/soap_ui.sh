#!/usr/bin/env bash
# This script install soapUi
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes curl

cd $HOME
# download SoapUI
curl -L https://s3.amazonaws.com/downloads.eviware/soapuios/5.5.0/SoapUI-x64-5.5.0.sh ./SoapUI-x64-5.5.0.sh

# Install SoapUI
chmod 755 SoapUI-x64-5.5.0.sh
set +eu
bash ./SoapUI-x64-5.5.0.sh -q
set -eu

rm -rf SoapUI-Tutorials SoapUI-x64-5.5.0.sh
