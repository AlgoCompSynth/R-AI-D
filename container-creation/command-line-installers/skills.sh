#! /usr/bin/env bash

set -e

echo "..Cloning Posit skills to $HOME/.agents/skills" 1>&2
mkdir --parents $HOME/.agents
pushd $HOME/.agents
  rm --force --recursive skills
  git clone --quiet https://github.com/posit-dev/skills
popd
echo "..Clone completed" 1>&2
