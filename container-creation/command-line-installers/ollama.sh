#! /usr/bin/env bash

set -e

source set_container_envars

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh

echo "..Ollama is installed"
echo "..Enabling ollama.service"
sudo systemctl enable --now ollama.service

ollama --version
echo ""

echo "** Finished Ollama **"
echo ""
