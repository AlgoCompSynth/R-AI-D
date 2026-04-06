#! /usr/bin/env bash

set -e

echo "..Testing for host install"
if [[ "$(set | grep CONTAINER_ID | wc -l)" == "0" ]]
then
  echo "..Running in the host - coding assistants won't be installed"
  exit

fi

echo "..Testing for opencode"
if [[ "$(which opencode | wc -l)" == "0" ]]
then
  echo "..Installing opencode with official installer"
  curl -fsSL https://opencode.ai/install | bash

  echo "..opencode is installed"

else
  echo "..opencode is installed"

fi
