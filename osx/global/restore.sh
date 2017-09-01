#!/bin/sh
. ./_files.sh

set -x

for f in $files
do
  backup="$(printf "%s" ${f#/} | sed 's,/,-,g')"
  if ! cmp -s "$backup" "$f"
  then
    sudo cp "$backup" "$f"
  fi
done
