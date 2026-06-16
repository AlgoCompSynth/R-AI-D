#! /usr/bin/env -S bash -l

set -e

for model in \
  granite4.1:3b-q8_0 \
  qwen3.5:0.8b \
  qwen3.5:2b \
  qwen3.5:4b

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done
