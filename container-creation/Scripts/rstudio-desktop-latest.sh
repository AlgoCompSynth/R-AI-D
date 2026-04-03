#! /usr/bin/env bash

echo "** RStudio Desktop Latest **"

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

export FILTER=".products.electron.platforms.${PLATFORM}.link"
echo "FILTER: $FILTER"

echo "..Downloading index"
rm --force *.json *.deb
wget --quiet https://dailies.rstudio.com/rstudio/latest/index.json

export RSTUDIO_DESKTOP_URL="$(jq $FILTER index.json | sed 's/"//g')"
echo "RSTUDIO_DESKTOP_URL: $RSTUDIO_DESKTOP_URL"
echo "..Downloading"
wget --quiet "$RSTUDIO_DESKTOP_URL"

echo "..Installing RStudio Desktop"
export DEBIAN_FRONTEND=noninteractive
sudo gdebi -n rstudio-*.deb

echo "..Cleanup"
rm --force *.json *.deb

echo "..Copying nerd fonts to $HOME/.config/rstudio/fonts"
mkdir --parents $HOME/.config/rstudio/fonts
cp \
  /home/linuxbrew/.linuxbrew/Caskroom/font-caskaydia-cove-nerd-font/3.4.0/CaskaydiaCoveNerdFontMono-*.ttf \
  $HOME/.config/rstudio/fonts/

echo "** Finished RStudio Desktop Latest **"
echo ""
