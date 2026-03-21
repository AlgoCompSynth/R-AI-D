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
#devstral-small-2:24b-instruct-2512-q4_K_M    24277f07f62d    15 GB     25 seconds ago
#magistral:24b-small-2506-q4_K_M              27bcbbf6d324    14 GB     24 seconds ago
#lfm2:24b-q4_K_M                              d6c816d74887    14 GB     24 seconds ago
#gpt-oss:20b                                  17052f91a42e    13 GB     23 seconds ago
#qwen3.5:9b-q8_0                              441ec31e4d2a    10 GB     25 seconds ago
#deepseek-r1:14b-qwen-distill-q4_K_M          c333b7232bdb    9.0 GB    23 seconds ago
#cogito:14b-v1-preview-qwen-q4_K_M            d0cac86a2347    9.0 GB    22 seconds ago
#qwen3.5:9b-q4_K_M                            6488c96fa5fa    6.6 GB    2 seconds ago
#ministral-3:8b-instruct-2512-q4_K_M          1922accd5827    6.0 GB    1 second ago
#deepseek-r1:8b-0528-qwen3-q4_K_M             6995872bfe4c    5.2 GB    1 second ago
#granite3.3:8b                                fd429f23b909    4.9 GB    Less than a second ago
#cogito:8b-v1-preview-llama-q4_K_M            75b508ddece1    4.9 GB    Less than a second ago
#qwen3.5:4b-q4_K_M                            2a654d98e6fb    3.4 GB    16 minutes ago
#NAME                                         ID              SIZE      MODIFIED
