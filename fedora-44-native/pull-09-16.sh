#! /usr/bin/env -S bash -l

set -eu

for model in \
  gemma4:12b-it-q8_0 \
  gemma4:26b-a4b-it-qat \
  gpt-oss:20b \
  qwen3.5:9b-q8_0
do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done
