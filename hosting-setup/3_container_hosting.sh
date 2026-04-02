#! /usr/bin/env bash

set -e

echo "** Container Hosting **"

source set_script_envars

export LOGFILE=$LOGFILES/container_hosting.log
rm --force $LOGFILE

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "..Testing for distrobox"
if [[ "$(which distrobox | wc -l)" != "0" ]]
then
  echo "..distrobox is installed"
  exit

fi

echo "..Installing distrobox from Linuxbrew"
brew install distrobox podman > $LOGFILE

echo "** Finished Container Hosting **"
echo ""
