#! /usr/bin/env bash

set -e

source set_container_envars

echo "..Downloading RStudio Desktop"

rm --force $RSTUDIO_DESKTOP_PACKAGE
wget --quiet $RSTUDIO_DESKTOP_URL
ls -l $RSTUDIO_DESKTOP_PACKAGE

echo "..Installing RStudio Desktop"
gdebi --non-interactive ./$RSTUDIO_DESKTOP_PACKAGE 2> /dev/null
rm --force $RSTUDIO_DESKTOP_PACKAGE
