#! /usr/bin/env -S bash -l

set -eu
source set-envars > /dev/null

# https://opencode.ai/docs#install
echo "..Installing OpenCode"
npm install -g opencode-ai > /dev/null
echo "..OpenCode is installed."
