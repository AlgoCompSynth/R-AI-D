#! /usr/bin/env -S bash -l

set -eu

for model in \
  gemma4:e2b-it-qat \
  gemma4:e4b-it-qat

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done

ollama list | sort -k 3 -n
