#!/bin/sh
set -x

# Ask for the administrator password upfront
sudo -v

sudo port select --set cython cython27
sudo port select --set python python34
sudo port select --set python2 python27
sudo port select --set python3 python34
sudo port select --set ruby ruby20
sudo port select --set scala scala2.11

port select --summary
