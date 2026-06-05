#! /usr/bin/env -S bash -l

set -e

source set_container_envars

# https://goose-docs.ai/docs/getting-started/installation/
echo "..Installing goose" 1>&2
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash -l
echo "..Goose is installed." 1>&2
echo "..You will need to run 'goose configure' to set the Ollama model." 1>&2
