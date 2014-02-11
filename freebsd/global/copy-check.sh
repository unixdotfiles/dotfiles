#!/bin/sh
files="
/boot/loader.conf
/etc/rc.conf
"

for f in $files
do
	cp $f $(printf "%s" ${f#/} | sed 's,/,-,g')
done

hg diff -q . && (echo "Press any key to continue or C-c to cancel" && read _) && hg ci .
