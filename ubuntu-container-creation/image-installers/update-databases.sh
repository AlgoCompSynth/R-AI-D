#! /usr/bin/env bash

set -e

echo "** Update Databases **"

echo "..Updating apt-file database"
apt-file update

echo "..Updating 'man' page database"
mandb

echo "..Updating 'locate' database"
updatedb

echo "** Finished Update Databases **"
echo ""
