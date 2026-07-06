#! /usr/bin/env -S bash -l

set -eu

for model in \
  gemma4:31b-it-qat \
  glm-4.7-flash:q4_K_M \
  laguna-xs-2.1:q4_K_M \
  north-mini-code-1.0:q4_K_M \
  ornith:35b-q4_K_M \
  qwen3.6:27b-mtp-q4_K_M \
  qwen3.6:35b-a3b-mtp-q4_K_M

do
  echo ""
  echo "Pulling $model"
  /usr/bin/time ollama pull $model

done
