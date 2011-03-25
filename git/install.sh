#!/bin/sh

gc() {
	git config --global $@
}

if [ "$USER" = "eitan" -o "$USER" = "eadler" -o "$USER" = "eadler1" ]
then
	gc user.name "Eitan Adler"
	gc user.email "lists@eitanadler.com"
fi

# Email formatting options
gc sendemail.confirm always
gc sendemail.supresscc self

gc apply.whitespace warn

# Aliases
git config --global alias.co checkout
git config --global alias.ci commit 
git config --global alias.st status
git config --global alias.w  whatchanged

# Coloring options
gc color.branch auto
gc color.diff auto
gc color.branch.current red bold
gc color.branch.local red
gc color.branch.remote green
gc color.diff.meta yellow
gc color.diff.frag magenta
gc color.diff.old red bold
gc color.diff.new green bold
gc color.status added
gc color.status changed
gc color.status untracked


