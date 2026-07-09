#! /usr/bin/env -S bash -l

set -eu

# https://pi.dev/
echo "..Installing Pi coding agent"
npm install -g --ignore-scripts @earendil-works/pi-coding-agent
echo "..Pi coding agent is installed."
