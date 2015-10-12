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
sudo port select --set pip pip34
sudo port select --set ipython ipython34
sudo port select --set ipython2 ipython27
sudo port select --set ipython3 ipython34
sudo port select --set gcc mp-gcc49
sudo port select --set llvm mp-llvm-3.5

port select --summary
