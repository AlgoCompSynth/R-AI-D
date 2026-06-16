#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

# https://opencode.ai/docs#install
echo "..Installing OpenCode"
npm install -g opencode-ai > /dev/null
echo "..OpenCode is installed."
