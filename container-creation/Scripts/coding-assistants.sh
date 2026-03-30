#! /usr/bin/env bash

set -e

echo "..Installing codex dependency 'bubblewrap'"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y --no-install-recommends \
  bubblewrap \
  >> $LOGFILE 2>&1

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "..Testing for host install"
if [[ "$(set | grep CONTAINER_ID | wc -l)" == "0" ]]
then
  echo "..Running in the host - coding assistants won't be installed"
  exit

fi

echo "..Testing for opencode"
if [[ "$(which opencode | wc -l)" == "0" ]]
then
  echo "..Installing opencode from Linuxbrew"
  brew install anomalyco/tap/opencode >> $LOGFILE 2>&1

  echo "..opencode is installed"

else
  echo "..opencode is installed"

fi

echo "..Testing for codex"
if [[ "$(which codex | wc -l)" == "0" ]]
then
  echo "..Installing codex from Linuxbrew"
  brew install codex >> $LOGFILE 2>&1

  echo "..codex is installed"

else
  echo "..codex is installed"

fi

echo "..Testing for claude"
if [[ "$(which claude | wc -l)" == "0" ]]
then
  echo "..Installing claude-code from Linuxbrew"
  brew install --cask claude-code >> $LOGFILE 2>&1

  echo "..claude is installed"

else
  echo "..claude is installed"

fi
