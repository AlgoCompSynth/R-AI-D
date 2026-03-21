#! /usr/bin/env bash

set -e

echo "** Small Models **"

echo "Setting permissions on host model storage"
sudo chown --recursive ollama:ollama /usr/share/ollama

for model in \
  qwen3.5:9b-q4_K_M \
  deepseek-r1:8b-0528-qwen3-q4_K_M \
  cogito:8b-v1-preview-llama-q4_K_M

do
  echo ""
  echo "Pulling $model"
  ollama pull $model

done

ollama list | sort -nr -k 3

echo "** Finished Small Models **"
echo ""
#glm-4.7-flash:q4_K_M                   d1a8a26252f1    19 GB     4 seconds ago
#deepseek-r1:32b-qwen-distill-q4_K_M    edba8017331d    19 GB     4 seconds ago
#cogito:32b-v1-preview-qwen-q4_K_M      0b4aab772f57    19 GB     5 seconds ago
#qwen3.5:27b-q4_K_M                     7653528ba5cb    17 GB     5 seconds ago
#gpt-oss:20b                            17052f91a42e    13 GB     3 seconds ago
#deepseek-r1:14b-qwen-distill-q4_K_M    c333b7232bdb    9.0 GB    2 seconds ago
#cogito:14b-v1-preview-qwen-q4_K_M      d0cac86a2347    9.0 GB    3 seconds ago
#qwen3.5:9b-q4_K_M                      6488c96fa5fa    6.6 GB    1 second ago
#deepseek-r1:8b-0528-qwen3-q4_K_M       6995872bfe4c    5.2 GB    Less than a second ago
#cogito:8b-v1-preview-llama-q4_K_M      75b508ddece1    4.9 GB    Less than a second ago
#NAME                                   ID              SIZE      MODIFIED
