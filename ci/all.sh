#!/bin/sh
set -ex
cd "$(git rev-parse --show-toplevel)"
shellcheck -x installer.sh
