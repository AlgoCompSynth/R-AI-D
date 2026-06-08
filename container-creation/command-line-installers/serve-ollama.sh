#! /usr/bin/env -S bash -l

set -e

source set_container_envars

mkdir --parents $LOGFILES
sudo systemctl enable --now ollama.service \
  || ollama serve > $LOGFILES/ollama-serve.log 2>&1 &
