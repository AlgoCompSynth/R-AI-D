#! /usr/bin/env bash

set -e

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "..Testing for opencode"
if [[ "$(which opencode | wc -l)" == "0" ]]
then
  echo "..Installing opencode from Linuxbrew"
  brew install anomalyco/tap/opencode > /dev/null

  echo "..opencode is installed"

else
  echo "..opencode is installed"

fi

echo "..Testing for codex"
if [[ "$(which codex | wc -l)" == "0" ]]
then
  echo "..Installing codex from Linuxbrew"
  brew install codex > /dev/null

  echo "..codex is installed"

else
  echo "..codex is installed"

fi

echo "..Testing for claude"
if [[ "$(which claude | wc -l)" == "0" ]]
then
  echo "..Installing claude-code from Linuxbrew"
  brew install --cask claude-code > /dev/null

  echo "..claude is installed"

else
  echo "..claude is installed"

fi
