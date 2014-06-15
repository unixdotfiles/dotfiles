#!/bin/sh
set -e
FILE=$(mktemp "$HOME/screenshots/$(date -j +'%Y-%m-%d-%H-%M-%S').png")
scrot "$FILE"
