#! /usr/bin/env bash

set -e

echo "** Ollama **"

source set_container_envars

# https://docs.ollama.com/linux#install
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh

echo "..Ollama is installed"
echo "..Enabling ollama.service"
systemctl enable ollama.service

echo ""
echo "..Ollama libraries"
ls --recursive /usr/local/lib/ollama
echo ""

ollama --version
echo ""

echo "** Finished Ollama **"
echo ""
