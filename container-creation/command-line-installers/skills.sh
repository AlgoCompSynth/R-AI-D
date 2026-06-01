#! /usr/bin/env bash

set -e

echo "..Cloning Posit skills to $HOME/Projects/skills" 1>&2
pushd $HOME/Projects
  rm --force --recursive skills
  git clone --quiet https://github.com/posit-dev/skills
popd
echo "..Clone completed" 1>&2
