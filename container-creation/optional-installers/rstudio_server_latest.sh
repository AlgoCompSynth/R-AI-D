#! /usr/bin/env bash

echo "** RStudio Server Latest **"

set -e

source set_container_envars
export LOGFILE=$LOGFILES/rstudio_server_latest.log
rm --force $LOGFILE

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
pushd /tmp > /dev/null
  rm --force *.json *.deb
  wget --quiet https://dailies.rstudio.com/rstudio/latest/index.json

  export RSTUDIO_SERVER_URL="$(jq $FILTER index.json | sed 's/"//g')"
  echo "RSTUDIO_SERVER_URL: $RSTUDIO_SERVER_URL"
  echo "..Downloading package"
  wget --quiet "$RSTUDIO_SERVER_URL"

  echo "..Installing RStudio Server"
  export DEBIAN_FRONTEND=noninteractive
  sudo gdebi -n rstudio-server-*.deb \
    >> $LOGFILE 2>&1

  echo "..Cleanup"
  rm --force *.json *.deb

popd > /dev/null

echo "..Copying nerd fonts to /etc/rstudio/fonts/"
sudo cp $HOME/.fonts/*.ttf /etc/rstudio/fonts/

echo "..Enabling and starting RStudio Server"
sudo systemctl enable --now rstudio-server.service

echo "..Cleanup"
rm --force *.json *.deb

echo "..You need to set a password to log into RStudio Server!"
sudo passwd $USER

echo "** Finished RStudio Server Latest **"
echo ""
