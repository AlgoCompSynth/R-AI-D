#! /usr/bin/env -S bash -l

set -eu

for model in \
  gemma4:12b-it-qat \
  gemma4:12b-it-q4_K_M \
  qwen3.5:9b-q4_K_M

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done
