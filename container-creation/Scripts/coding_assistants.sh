#! /usr/bin/env bash

set -e

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "..Testing for host install"
if [[ "$(set | grep CONTAINER_ID | wc -l)" == "0" ]]
then
  echo "..Running in the host - coding assistants won't be installed"
  exit

fi

echo "..Testing for opencode"
if [[ "$(which opencode | wc -l)" == "0" ]]
then
  echo "..Installing opencode from Linuxbrew"
  brew install anomalyco/tap/opencode >> $LOGFILE 2>&1

  echo "..opencode is installed"

else
  echo "..opencode is installed"

fi
