#! /usr/bin/env -S bash -l

set -e

source set_container_envars

mkdir --parents $PROJECTS

pushd $PROJECTS
  for project in \
    posit-dev/skills \
    AlgoCompSynth/eikosany \
    AlgoCompSynth/consonaR \
    AlgoCompSynth/XentonalAssistant

  do
    echo ""
    echo "..force-removing $(basename $project)"
    rm --force --recursive $(basename $project)
    echo "..cloning $project"
    git clone --quiet --recurse-submodules \
      https://github.com/${project}.git
    echo "..done"

  done

popd
