#! /usr/bin/env -S bash -l

set -e

for model in \
  gemma4:26b-a4b-it-qat \
  gemma4:31b-it-qat \
  qwen3.5:27b \
  qwen3.6:27b-mtp-q4_K_M \
  qwen3.6:35b-a3b-mtp-q4_K_M

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done
