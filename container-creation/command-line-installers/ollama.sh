#! /usr/bin/env bash

set -e

echo "..Testing for host install"
if [[ "$(set | grep CONTAINER_ID | wc -l)" == "0" ]]
then
  echo "..Running in the host - Ollama won't be installed"
  exit

fi

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh

echo "..Ollama is installed"
