#! /usr/bin/env bash

set -e

echo "** Medium Models **"

echo "Setting permissions on host model storage"
sudo chown --recursive ollama:ollama /usr/share/ollama

for model in \
  devstral-small-2:24b-instruct-2512-q4_K_M \
  magistral:24b-small-2506-q4_K_M \
  lfm2:24b-q4_K_M \
  gpt-oss:20b \
  deepseek-r1:14b-qwen-distill-q4_K_M \
  cogito:14b-v1-preview-qwen-q4_K_M

do
  echo ""
  echo "Pulling $model"
  ollama pull $model

done

ollama list | sort -nr -k 3

echo "** Finished Medium Models **"
echo ""
