#! /usr/bin/env bash

set -e

echo "..Downloading RStudio Server"
# https://posit.co/download/rstudio-server
export RSTUDIO_SERVER_VERSION="2026.04.0-526"
export RSTUDIO_SERVER_PACKAGE="rstudio-server-$RSTUDIO_SERVER_VERSION-amd64.deb"
export RSTUDIO_SERVER_URL="https://download2.rstudio.org/server/jammy/amd64"/$RSTUDIO_SERVER_PACKAGE
wget --quiet $RSTUDIO_SERVER_URL
ls -l $RSTUDIO_SERVER_PACKAGE

echo "..Installing RStudio Server"
gdebi --non-interactive ./$RSTUDIO_SERVER_PACKAGE
rm --force *.deb
