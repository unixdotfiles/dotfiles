#!/bin/sh

set -eu

_gc_prefix() {
  git config --global "$@"
}

gc() {
  _gc_prefix --replace-all "$@"
}

gc user.name "Eitan Adler"
#gc user.email "lists@eitanadler.com"
#gc sendemail.from "lists@eitanadler.com"
gc --bool user.useconfigonly true

# Email formatting options
gc sendemail.confirm always
gc sendemail.supresscc self
gc sendemail.chainreplyto false

# Patch format options
gc --bool format.signoff true

gc apply.whitespace warn

gc core.autocrlf input
gc --bool core.safecrlf true

# Aliases
gc alias.amend 'commit --amend'
gc alias.bvv 'branch --list -vv'
gc alias.cat 'cat-file -p'
gc alias.co 'checkout'
gc alias.cbranch 'symbolic-ref --short -q HEAD'
gc alias.contains '!f() { git branch --contains "$1"; git tag --contains "$1"; }; f'
gc alias.count 'count-objects -v'
gc alias.dci 'svn dcommit'
gc alias.fixup 'commit -a --amend -C HEAD'
gc alias.fulllog 'log --graph --decorate --boundary --left-right --source --cherry-mark --format=fuller'
gc alias.last 'log --oneline -1'
gc alias.lg 'log --graph "--format=%m%Cblue%h%Creset %Cred%an%Creset %Cgreen%ar%Creset %Cblue%d%Creset %s" --all'
gc alias.pout '!git diff --stat -p $(git tracking) HEAD'
gc alias.type 'cat-file -t'
gc alias.rollback 'reset --soft HEAD^'
gc alias.view 'log --decorate --boundary --left-right --oneline --cherry-mark'
gc alias.st 'status'
gc alias.sync '!git pull && git push && git submodule update --init --recursive'
gc alias.tracking '!git for-each-ref --format="%(upstream:short)" $(git symbolic-ref -q HEAD)'
gc alias.whatis '!f() { git cat-file -e "$1" && printf "type=" && git cat-file -t "$1" && printf "size=" && git cat-file -s "$1"; }; f'

# Coloring options
gc color.branch auto
gc color.diff auto
gc color.status auto
gc color.ui auto
gc color.branch.current "red bold"
gc color.branch.local red
gc color.branch.remote blue
gc color.diff.frag magenta
gc color.diff.old "red bold"
gc color.diff.new "blue bold"
#gc color.status added
#gc color.status changed
#gc color.status untracked

gc diff.renames copies
gc --bool diff.mnemonicprefix true

#Don't throw anything away
gc --bool core.logAllRefUpdates true
gc gc.reflogExpire never
gc gc.reflogExpireUnreachable never
gc gc.rerereResolved '90'
gc gc.rerereUnresolved '90'
gc gc.pruneExpire never
gc gc.worktreePruneExpire never
gc --bool core.precomposeunicode true
gc --int gc.auto 0
gc --bool receive.autogc false

gc --bool core.quotepath true

# Set pull to rebase instead of merge
gc branch.autosetuprebase always
gc --bool rebase.stat true

gc --bool status.submodulesummary true
gc push.recurseSubmodules check

gc diff.algorithm histogram
gc --bool diff.compactionHeuristic true
gc --bool diff.indentheuristic true

#Nicer conflict markers (shows 'before' too)
gc merge.conflictstyle diff3
gc --bool merge.branchdesc true

gc --bool rerere.enabled true

gc --path init.templatedir '~/.conf/git/template/'
gc --path core.excludesfile '~/.conf/git/gitignore'
gc --path core.attributesfile '~/.conf/git/attributes'

gc --int commit.verbose 1
gc --int help.autocorrect -1

[ -z "$(git config --get --global push.default)" ] && gc push.default simple

gc notes.mergeStrategy 'union'

gc gitcvs.commitMsgAnnotation ''

gc --bool http.sslTry true

gc --bool gui.warndetachedcommit true
gc gui.spellingdictionary en_US
gc gui.maxrecentrepo 25

# URLs that should be auto replaced
_gc_prefix --remove-section url.git@github.com: 2>/dev/null || true
_gc_prefix --add url.git@github.com:.pushInsteadOf https://github.com/
_gc_prefix --add url.git@github.com:.pushInsteadOf git://github.com/
_gc_prefix --remove-section url.git@gist.github.com: 2>/dev/null || true
_gc_prefix --add url.git@gist.github.com:.pushInsteadOf git://gist.github.com/
_gc_prefix --remove-section url.git@bitbucket.org: 2>/dev/null || true
_gc_prefix --add url.git@bitbucket.org:.pushInsteadOf https://bitbucket.org/
_gc_prefix --add url.git@bitbucket.org:.pushInsteadOf http://bitbucket.org/
_gc_prefix --add url.git@bitbucket.org:.pushInsteadOf git://bitbucket.org/
_gc_prefix --remove-section url.git://git.debian.org/d-i/ 2>/dev/null || true
_gc_prefix --remove-section url.git+ssh://git.debian.org/git/d-i/ 2>/dev/null || true
_gc_prefix --add url.git://git.debian.org/d-i/.insteadOf git+ssh://git.debian.org/git/d-i/
_gc_prefix --add url.git+ssh://git.debian.org/git/d-i/.pushInsteadOf git+ssh://git.debian.org/git/d-i/
_gc_prefix --remove-section url.git+ssh://dweller@secure.phabricator.com 2>/dev/null || true
_gc_prefix --add url.git+ssh://dweller@secure.phabricator.com.pushInsteadOf https://secure.phabricator.com
