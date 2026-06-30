#! /usr/bin/env -S bash -l

set -eu

for model in \
  granite4.1:3b-q8_0 \
  qwen3.5:4b-q4_K_M

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done
