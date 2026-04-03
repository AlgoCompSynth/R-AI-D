#! /usr/bin/env bash

echo "** RStudio Server Latest **"

set -e

source set_script_envars

# https://dailies.rstudio.com/json-api/
if [[ "${ARCH}" == "x86_64" ]]
then
  export PLATFORM="[\"noble-amd64\"]"

elif [[ "${ARCH}" == "aarch64" ]]
then
  export PLATFORM="[\"noble-arm64\"]"

else
  echo "ARCH: $ARCH is not supported - exiting!"
  exit -255

fi

export FILTER=".products.server.platforms.${PLATFORM}.link"
echo "FILTER: $FILTER"

echo "..Downloading index"
rm --force *.json *.deb
wget --quiet https://dailies.rstudio.com/rstudio/latest/index.json

export RSTUDIO_SERVER_URL="$(jq $FILTER index.json | sed 's/"//g')"
echo "RSTUDIO_SERVER_URL: $RSTUDIO_SERVER_URL"
echo "..Downloading"
wget --quiet "$RSTUDIO_SERVER_URL"

echo "..Installing RStudio Server"
export DEBIAN_FRONTEND=noninteractive
sudo gdebi -n rstudio-server-*.deb

echo "..Enabling and starting RStudio Server"
sudo systemctl enable --now rstudio-server.service

echo "..Copying nerd fonts to $HOME/.config/rstudio/fonts"
mkdir --parents $HOME/.config/rstudio/fonts
cp \
  /home/linuxbrew/.linuxbrew/Caskroom/font-caskaydia-cove-nerd-font/3.4.0/CaskaydiaCoveNerdFontMono-*.ttf \
  $HOME/.config/rstudio/fonts/

echo "..You need to set a password to log into RStudio Server!"
sudo passwd $USER

echo "..Cleanup"
rm --force *.json *.deb

echo "** Finished RStudio Server Latest **"
echo ""
