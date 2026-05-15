#! /usr/bin/env bash

set -e

source set_container_envars

echo "..Downloading RStudio Server"

rm --force $RSTUDIO_SERVER_PACKAGE
wget --quiet $RSTUDIO_SERVER_URL
ls -l $RSTUDIO_SERVER_PACKAGE

echo "..Installing RStudio Server"
gdebi --non-interactive ./$RSTUDIO_SERVER_PACKAGE
rm --force $RSTUDIO_SERVER_PACKAGE
