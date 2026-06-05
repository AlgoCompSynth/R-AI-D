#! /usr/bin/env -S bash -l

set -e

source set_container_envars

for model in \
  gemma4:e2b \
  gemma4:e4b \
  gemma4:12b \
  gemma4:26b \
  gemma4:31b \
  qwen3.5:0.8b \
  qwen3.5:2b \
  qwen3.5:4b \
  qwen3.5:9b \
  qwen3.5:27b \
  qwen3.6:27b

do
  /usr/bin/time ollama pull $model

done

ollama list | sort -k 3 -n
