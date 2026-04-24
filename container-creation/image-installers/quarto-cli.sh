#! /usr/bin/env bash

set -e

echo "** Quarto **"

source set_container_envars

# https://github.com/quarto-dev/quarto-cli/releases
export QUARTO_VERSION="1.9.37"

if [[ "$ARCH" == "x86_64" ]]
then
  QUARTO_PACKAGE="quarto-${QUARTO_VERSION}-linux-amd64.deb"

elif [[ "$ARCH" == "aarch64" ]]
then
  QUARTO_PACKAGE="quarto-${QUARTO_VERSION}-linux-arm64.deb"

else
  echo "..Unsupported architecture - exiting!"
  exit -255

fi

export QUARTO_URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/${QUARTO_PACKAGE}"

echo "..Downloading ${QUARTO_URL}"
rm --force *.deb
wget --quiet ${QUARTO_URL}

echo "..Installing Quarto"
export DEBIAN_FRONTEND=noninteractive
sudo dpkg --install ${QUARTO_PACKAGE}

echo "..Cleanup"
rm --force *.deb

echo "** Finished Quarto **"
echo ""
