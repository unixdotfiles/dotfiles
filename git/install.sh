#!/bin/sh 

gc() {
	git config --global --replace-all "$@"
}

gc user.name "Eitan Adler"
#gc user.email "lists@eitanadler.com"
#gc sendemail.from "lists@eitanadler.com"

# Email formatting options
gc sendemail.confirm always
gc sendemail.supresscc self
gc sendemail.chainreplyto false

# Patch format options
gc --bool format.signoff true

gc apply.whitespace warn

# Aliases
gc alias.amend "commit --amend -v"
gc alias.bvv "branch --list -vv"
gc alias.cat "cat-file -p"
gc alias.co checkout
gc alias.ci 'commit -v'
gc alias.contains "branch -a --contains"
gc alias.count "count-objects -v"
gc alias.dci "svn dcommit"
gc alias.fixup "commit -a --amend -C HEAD"
gc alias.last "log --oneline -1"
gc alias.lg "log --graph '--format=%m%Cblue%h%Creset %Cred%an%Creset %Cgreen%ar%Creset %Cblue%d%Creset %s'"
gc alias.view "log --graph --decorate --oneline --boundary"
gc alias.rollback 'reset HEAD^'
gc alias.st status
gc alias.w  whatchanged

# Coloring options
gc color.branch auto
gc color.diff auto
gc color.branch.current "red bold"
gc color.branch.local red
gc color.branch.remote blue
gc color.diff.frag magenta
gc color.diff.old "red bold"
gc color.diff.new "blue bold"
#gc color.status added
#gc color.status changed
#gc color.status untracked

gc --bool diff.mnemonicprefix true

#Don't throw anything away
gc core.logAllRefUpdates true
gc gc.reflogExpire none
gc gc.reflogExpireUnreachable none
gc gc.auto 0

gc core.quotepath true

# Set pull to rebase instead of merge
gc branch.autosetuprebase remote

# core.precomposeunicode

gc diff.algorithm patience

#Nicer conflict markers (shows 'before' too)
gc merge.conflictstyle diff3

gc init.templatedir '~/.conf/git/template/'
gc core.excludesfile '~/.conf/git/gitignore'



gc push.default simple
