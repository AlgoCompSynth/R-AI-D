#! /usr/bin/env -S bash -l

set -eu

# https://goose-docs.ai/docs/getting-started/installation/
echo "..Installing goose"
curl -fsSL \
  https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh \
  | CONFIGURE=false bash -l \
  > /dev/null
echo "..Goose is installed."
echo "..You will need to run 'goose configure' to set the Ollama model."
