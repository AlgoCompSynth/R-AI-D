#! /usr/bin/env bash

set -e

echo "** Large Models **"

echo "Setting permissions on host model storage"
sudo chown --recursive ollama:ollama /usr/share/ollama

for model in \
  glm-4.7-flash:q4_K_M \
  deepseek-r1:32b-qwen-distill-q4_K_M \
  cogito:32b-v1-preview-qwen-q4_K_M \
  qwen3.5:27b-q4_K_M

do
  echo ""
  echo "Pulling $model"
  ollama pull $model

done

ollama list | sort -nr -k 3

echo "** Finished Large Models **"
echo ""
