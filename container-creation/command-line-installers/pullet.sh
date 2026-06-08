#! /usr/bin/env -S bash -l

set -e

for model in \
  gemma4:e2b-it-qat \
  gemma4:e4b-it-qat \
  gemma4:12b-it-qat \
  gemma4:26b-a4b-it-qat \
  gemma4:31b-it-qat \
  qwen3.5:0.8b \
  qwen3.5:2b \
  qwen3.5:4b \
  qwen3.5:9b \
  qwen3.5:27b \
  qwen3.6:27b-mtp-q4_K_M \
  qwen3.6:35b-a3b-mtp-q4_K_M

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done

ollama list | sort -k 3 -n
