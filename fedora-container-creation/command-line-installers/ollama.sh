#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

# https://docs.ollama.com/linux#install
echo "..Stopping existing ollama.service if any"
sudo systemctl disable --now ollama.service > /dev/null 2>&1 || true
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh
echo "..Restarting / enabling ollama.service"
sudo systemctl enable --now ollama.service
echo "..Exporting ollama to host"
distrobox-export --bin $(which ollama)
