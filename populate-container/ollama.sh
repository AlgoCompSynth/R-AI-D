#! /usr/bin/env -S bash -l

set -eu

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh || true
echo "..Forcing ollama:ollama ownership of /usr/share/ollama"
sudo chown -R ollama:ollama /usr/share/ollama
echo "..Ollama is installed"
