#!/bin/sh
files="
/boot/loader.conf
/etc/devfs.conf
/etc/dhclient.conf
/etc/login.conf
/etc/make.conf
/etc/newsyslog.conf
/etc/pf.conf
/etc/rc.conf
/etc/src.conf
/etc/sysctl.conf
/etc/syslog.conf
/usr/local/etc/pkg.conf
"

for f in $files
do
	cp $f $(printf "%s" ${f#/} | sed 's,/,-,g')
done

git diff --exit-code . || (echo "Press any key to continue or C-c to cancel" && read _) && git ci .
