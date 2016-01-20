#!/bin/sh
files="
/opt/local/etc/macports/macports.conf
/opt/local/etc/macports/sources.conf
/opt/local/etc/macports/variants.conf
/etc/exports
/etc/launchd.conf
/etc/sysctl.conf
"

for f in $files
do
	cp $f $(printf "%s" ${f#/} | sed 's,/,-,g')
done

git diff --exit-code . || (echo "Press any key to continue or C-c to cancel" && read _) && git ci .
