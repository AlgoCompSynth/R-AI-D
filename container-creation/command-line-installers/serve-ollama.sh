#! /usr/bin/env -S bash -l

set -e

mkdir --parents $HOME/Logfiles
sudo systemctl enable --now ollama.service \
  || OLLAMA_MODELS=$HOME/.ollama/models ollama serve > $HOME/Logfiles/ollama-serve.log 2>&1 &
