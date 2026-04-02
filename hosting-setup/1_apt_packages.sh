#! /usr/bin/env bash

set -e

echo "* apt Packages *"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/apt_packages.log

echo "..Updating repository index"
sudo apt-get update -qq \
  >> $LOGFILE 2>&1
echo "..Installing required packages"
sudo apt-get install -qqy \
  apt-file \
  build-essential \
  curl \
  file \
  flatpak \
  plocate \
  time \
  tree \
  uidmap \
  vim-nox \
  wget \
  zstd \
  >> $LOGFILE 2>&1
echo "..Updating apt-file database"
sudo apt-file update \
  >> $LOGFILE 2>&1
echo "..Updating locate database"
sudo updatedb \
  >> $LOGFILE 2>&1
echo "..Adding FlatHub"
flatpak remote-add --if-not-exists \
  flathub \
  https://dl.flathub.org/repo/flathub.flatpakrepo \
  >> $LOGFILE 2>&1

echo "* Finished apt Packages *"
echo ""
