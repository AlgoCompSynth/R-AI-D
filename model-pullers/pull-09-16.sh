#! /usr/bin/env -S bash -l

set -eu

for model in \
  gemma4:12b-it-qat \
  gpt-oss:20b
do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done

ollama list | sort -k 3 -n
