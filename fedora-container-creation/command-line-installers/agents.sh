#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

# https://opencode.ai/docs#install
echo "..Installing OpenCode"
npm install -g opencode-ai > /dev/null
echo "..OpenCode is installed."

# https://pi.dev/docs/latest/quickstart#install
echo "..Installing Pi coding agent"
npm install -g --ignore-scripts @earendil-works/pi-coding-agent > /dev/null
echo "..Pi coding agent is installed."

# https://goose-docs.ai/docs/getting-started/installation/
echo "..Installing goose"
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash -l > /dev/null
echo "..Goose is installed."
echo "..You will need to run 'goose configure' to set the Ollama model."
