#! /usr/bin/env bash

set -e

echo "* Flatpaks *"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/flatpaks.log
rm --force $LOGFILE

for app in \
  app.devsuite.Ptyxis \
  io.github.kolunmi.Bazaar \
  io.podman_desktop.PodmanDesktop \
  io.github.dvlv.boxbuddyrs \
  org.kde.konsole 

do
  echo "..$app"
  sudo flatpak install --system --assumeyes $app \
  >> $LOGFILE 2>&1

done

echo ""
echo "Name|Application ID|Version|Branch|Installation"
flatpak list | sed 's/\t/\|/g'
echo ""

echo "* Finished Flatpaks *"
echo ""
