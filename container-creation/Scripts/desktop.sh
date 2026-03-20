#! /usr/bin/env bash

set -e

echo ""
echo "* Desktop Setup *"

echo "Creating 'desktop'"
export LOCALBIN=$HOME/.local/bin; echo "LOCALBIN: $LOCALBIN"; mkdir --parents $LOCALBIN
export LOGFILES=$HOME/Logfiles; echo "LOGFILES: $LOGFILES"; mkdir --parents $LOGFILES
export PROJECTS=$HOME/Projects; echo "PROJECTS: $PROJECTS"; mkdir --parents $PROJECTS
export SCRIPTS=$HOME/Scripts; echo "SCRIPTS: $SCRIPTS"; mkdir --parents $SCRIPTS
cp ./Scripts/* $SCRIPTS/

echo "* Finished Desktop Setup *"
echo ""
