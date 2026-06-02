#! /usr/bin/env bash

set -e

# https://pi.dev/docs/latest#quick-start
echo "..Installing pi-coding-agent"
npm install -g \
  --ignore-scripts \
  --min-release-age=0 \
  --prefix $HOME/.local \
  @earendil-works/pi-coding-agent

echo "..pi-coding-agent is installed"
