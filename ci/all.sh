#!/bin/sh
set -ex
cd "$(git rev-parse --show-toplevel)"
shellcheck -x installer.sh
shellcheck -eSC1090 -x scripts/*
shellcheck -eSC2016 -eSC2088 git/install.sh
