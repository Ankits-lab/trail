#!/usr/bin/env bash
mkdir mywork
cd mywork
apt-get update
apt-get install sudo -y
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y git git-core
git config --global user.name "keneankit01"
git config --global user.email "keneankit01@gmail.com"
git config --global color.ui false
echo SETUP DONE STARTING ANDROID SETUP
