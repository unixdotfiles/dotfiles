#!/bin/sh
. ./_files.sh

set -x

for f in $files
do
	sudo cp $(printf "%s" ${f#/} | sed 's,/,-,g') "$f"
done
