#! /usr/bin/env bash

set -e

source set_container_envars

pushd /tmp > /dev/null
  echo "..Downloading RStudio Server"
  rm --force $RSTUDIO_SERVER_PACKAGE
  wget --quiet $RSTUDIO_SERVER_URL
  echo "..Installing RStudio Server"
  sudo gdebi --non-interactive ./$RSTUDIO_SERVER_PACKAGE 2> /dev/null
  rm --force $RSTUDIO_SERVER_PACKAGE

  echo "..Downloading RStudio Desktop"
  rm --force $RSTUDIO_DESKTOP_PACKAGE
  wget --quiet $RSTUDIO_DESKTOP_URL
  ls -l $RSTUDIO_DESKTOP_PACKAGE
  echo "..Installing RStudio Desktop"
  sudo gdebi --non-interactive ./$RSTUDIO_DESKTOP_PACKAGE 2> /dev/null
  rm --force $RSTUDIO_DESKTOP_PACKAGE

popd > /dev/null
