#! /usr/bin/env -S bash -l

set -e

source set_container_envars

# https://opencode.ai/docs#install
echo "..Installing OpenCode"
npm install -g opencode-ai
echo "..OpenCode is installed."
