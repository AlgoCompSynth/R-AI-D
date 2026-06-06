#! /usr/bin/env -S bash -l

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

echo "..Pulling $BASE_MODEL and $ALT_MODEL - this will take some time"
/usr/bin/time ollama pull $BASE_MODEL
/usr/bin/time ollama pull $ALT_MODEL

echo "** Finished Ollama **"
echo ""
