#! /usr/bin/env -S bash -l

set -eu

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh
echo "..Ollama is installed"
