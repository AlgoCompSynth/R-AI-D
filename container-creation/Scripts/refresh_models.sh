#! /usr/bin/env bash

set -e

echo "** Refresh Models **"

echo "Setting permissions on host model storage"
sudo chown --recursive ollama:ollama /usr/share/ollama

for model in $(ollama list | sed 's/ .*$//' | grep -v NAME)
do
  echo ""
  echo "Pulling $model"
  ollama pull $model

done

ollama list | sort -nr -k 3

echo "** Finished Refresh Models **"
echo ""
