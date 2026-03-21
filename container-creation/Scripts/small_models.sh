#! /usr/bin/env bash

set -e

echo "** Small Models **"

echo "Setting permissions on host model storage"
sudo chown --recursive ollama:ollama /usr/share/ollama

for model in \
  qwen3.5:9b-q4_K_M \
  ministral-3:8b-instruct-2512-q4_K_M \
  deepseek-r1:8b-0528-qwen3-q4_K_M \
  granite3.3:8b \
  cogito:8b-v1-preview-llama-q4_K_M

do
  echo ""
  echo "Pulling $model"
  ollama pull $model

done

ollama list | sort -nr -k 3

echo "** Finished Small Models **"
echo ""
