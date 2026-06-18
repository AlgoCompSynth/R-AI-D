#! /usr/bin/env -S bash -l

set -e

for model in \
  gemma4:e2b-it-qat \
  gemma4:e4b-it-qat \
  gemma4:12b-it-qat \
  qwen3.5:9b

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done
