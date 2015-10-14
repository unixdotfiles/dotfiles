#!/bin/sh

. ../common_shell/functions.sh

set -x

# Ask for the administrator password upfront
sudo -v

sudo -H gem update
sudo -H gem update --system
