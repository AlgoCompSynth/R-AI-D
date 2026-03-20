#! /usr/bin/env bash

set -e

echo "** Large Models **"

echo "Setting permissions on host model storage"
sudo chown --recursive ollama:ollama /usr/share/ollama

for model in \
  cogito:32b-v1-preview-qwen-q4_K_M \
  deepseek-r1:32b-qwen-distill-q4_K_M \
  devstral-small-2:24b-instruct-2512-q4_K_M \
  glm-4.7-flash:q4_K_M \
  gpt-oss:20b \
  lfm2:24b-q4_K_M \
  magistral:24b-small-2506-q4_K_M \
  qwen3-coder:30b-a3b-q4_K_M \
  qwen3-vl:32b-instruct-q4_K_M \
  qwen3-vl:32b-thinking-q4_K_M \
  qwen3.5:27b-q4_K_M

do
  echo ""
  echo "Pulling $model"
  ollama pull $model

done

ollama list | sort -nr -k 3

echo "** Finished Large Models **"
echo ""
