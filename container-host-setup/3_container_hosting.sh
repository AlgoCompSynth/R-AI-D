#! /usr/bin/env bash

set -e

echo "** Container Hosting **"

source set_script_envars

export LOGFILE=$LOGFILES/container_hosting.log
rm --force $LOGFILE

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "..Installing podman from Linuxbrew"
brew install distrobox podman > $LOGFILE

echo "** Finished Container Hosting **"
echo ""
