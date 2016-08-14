#!/bin/sh
. ./_files.sh

for f in $files
do
	cp "$f" $(printf "%s" ${f#/} | sed 's,/,-,g')
done

git diff --exit-code . || (echo "Press any key to continue or C-c to cancel" && read _) && git ci .
