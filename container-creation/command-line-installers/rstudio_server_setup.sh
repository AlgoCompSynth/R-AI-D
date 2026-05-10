#! /usr/bin/env bash

set -e

echo "..Copying nerd fonts to /etc/rstudio/fonts/"
sudo cp $HOME/.fonts/*.ttf /etc/rstudio/fonts/

echo "..Enabling and starting RStudio Server"
sudo systemctl enable --now rstudio-server.service

echo ""
echo -e "\07"
echo "..You need to set a password to log into RStudio Server!"
echo -e "\07"
echo ""
sleep 10
sudo passwd $USER
