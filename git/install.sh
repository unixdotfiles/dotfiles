#!/bin/sh 

gc() {
	git config --global --replace-all "$@"
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
gc alias.co checkout
gc alias.ci commit 
gc alias.st status
gc alias.w  whatchanged
gc alias.rollback 'reset --soft HEAD^'

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
#gc color.status added
#gc color.status changed
#gc color.status untracked


