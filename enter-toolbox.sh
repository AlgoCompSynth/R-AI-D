#! /usr/bin/env -S bash -l

set -eu

echo "* Enter Toolbox *"

pushd ./populate-toolbox
  toolbox enter R-AI-D-toolbox

popd

echo "* Finished Enter Toolbox *"
echo ""
