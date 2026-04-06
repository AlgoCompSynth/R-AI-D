#! /usr/bin/env bash

set -e

echo "** Ollama **"

source set_script_envars

# https://docs.ollama.com/linux#install
echo "..Installing Ollama"
curl -fsSL https://ollama.com/install.sh | sh

echo "** Finished Ollama **"
echo ""
