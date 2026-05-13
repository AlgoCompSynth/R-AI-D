#! /usr/bin/env bash

set -e

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh

echo "..Ollama is installed"
echo "..Adding $ADMIN_USER to the 'ollama' group"
sudo usermod --append --groups ollama $ADMIN_USER
echo "..Enabling ollama.service"
sudo systemctl enable ollama.service
