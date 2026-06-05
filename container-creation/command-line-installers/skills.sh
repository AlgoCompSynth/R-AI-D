#! /usr/bin/env -S bash -l

set -e

source set_container_envars

echo "..Cloning Posit skills to $HOME/Projects"
mkdir --parents $HOME/Projects
pushd $HOME/Projects
  rm --force --recursive skills
  git clone --quiet https://github.com/posit-dev/skills
popd
echo "..Clone completed"
