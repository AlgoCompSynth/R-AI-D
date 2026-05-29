#! /usr/bin/env bash

set -e

echo "** Coding agents **"

source set_container_envars

echo "..Installing npm"
sudo apt-get install -qqy nodejs npm

echo "..Installing Goose"
curl -fsSL \
  https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh \
  | bash
echo "..Goose is installed"

echo "..Installing Pi Coding Agent"
sudo npm install -g --ignore-scripts @earendil-works/pi-coding-agent
echo "..Pi Coding Agent is installed"

echo "..Installing OpenCode CLI"
sudo npm install -g opencode-ai
echo "..OpenCode CLI is installed"

echo "** Finished Coding agents **"
echo ""
