#!/bin/sh
. ./_files.sh

for f in $files
do
	sudo cp $(printf "%s" ${f#/} | sed 's,/,-,g') "$f"
done
