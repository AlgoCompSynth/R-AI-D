#! /usr/bin/env bash

set -e

echo "** Ollama **"

echo "..Installing Linux dependencies"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -qqy --no-install-recommends \
  lshw \
  zstd

# https://docs.ollama.com/linux#install
echo "..Installing Ollama"
curl -fsSL https://ollama.com/install.sh | sh

echo "** Finished Ollama **"
echo ""
