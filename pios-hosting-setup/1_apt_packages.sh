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
  plocate \
  podman \
  time \
  tmux \
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

echo "* Finished apt Packages *"
echo ""
