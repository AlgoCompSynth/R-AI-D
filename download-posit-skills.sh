#! /usr/bin/env -S bash -l

set -eu

echo "* Download Posit Skills *"

echo "..Creating $HOME/Projects if necessary"
mkdir --parents $HOME/Projects
pushd $HOME/Projects

  if [[ -d skills ]]
  then
    echo "$HOME/Projects/skills already exists - exiting without error"
    exit 0

  fi

  echo "..Cloning https://github.com/posit-dev/skills.git"
  git clone https://github.com/posit-dev/skills.git

popd

echo "* Finished Download Posit Skills *"
echo ""
