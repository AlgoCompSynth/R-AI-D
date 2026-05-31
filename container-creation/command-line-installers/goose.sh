#! /usr/bin/env bash

set -e

# https://goose-docs.ai/docs/getting-started/installation/
echo "..Installing goose" 1>&2
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash
echo "..Goose is installed ... you will need to run 'goose configure'" 1>&2
