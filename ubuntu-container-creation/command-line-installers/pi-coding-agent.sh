#! /usr/bin/env -S bash -l

set -e

source set_container_envars

# https://pi.dev/docs/latest/quickstart#install
echo "..Installing pi coding agent"
npm install -g --ignore-scripts @earendil-works/pi-coding-agent
echo "..pi coding agent is installed."
