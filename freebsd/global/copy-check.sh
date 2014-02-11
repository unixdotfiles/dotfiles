#!/bin/sh
files="
/boot/loader.conf
/etc/rc.conf
"

for f in $files
do
	echo cp $f $(printf "%s" $f | sed 's,/,-,g')
done

hg diff -q . && hg ci .
