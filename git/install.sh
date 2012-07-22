#!/bin/sh 

gc() {
	git config --global --replace-all "$@"
}

if [ "$USER" = "eitan" -o "$USER" = "eadler" -o "$USER" = "eadler1" ]
then
	gc user.name "Eitan Adler"
	gc user.email "lists@eitanadler.com"
	gc sendemail.from "lists@eitanadler.com"
fi

# Email formatting options
gc sendemail.confirm always
gc sendemail.supresscc self
gc sendemail.chainreplyto false

# Patch format options
gc format.signoff true

gc apply.whitespace warn

# Aliases
gc alias.ammend "commit --amend -v"
gc alias.bvv "branch --list -vv"
gc alias.cat "cat-file -p"
gc alias.co checkout
gc alias.ci commit
gc alias.st status
gc alias.w  whatchanged
gc alias.rollback 'reset HEAD^'
gc alias.lg "log --graph '--format=%Cblue%h%Creset %Cgreen%ar%Creset %Cblue%d%Creset %s'"

# Coloring options
gc color.branch auto
gc color.diff auto
gc color.branch.current red bold
gc color.branch.local red
gc color.branch.remote blue
gc color.diff.frag magenta
gc color.diff.old red bold
gc color.diff.new blue bold
#gc color.status added
#gc color.status changed
#gc color.status untracked

#Garbage collection
gc gc.auto 0

