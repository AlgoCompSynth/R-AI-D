#! /usr/bin/env bash

set -e

echo "** Ollama **"

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh

echo "..Ollama is installed"
echo "..Enabling ollama.service"
systemctl enable ollama.service

echo "** Finished Ollama **"
echo ""
