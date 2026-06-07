#! /usr/bin/env -S bash -l

set -e

source set_container_envars

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh || true
ollama --version || true

echo "** Finished Ollama **"
echo ""
