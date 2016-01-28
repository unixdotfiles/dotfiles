#! /bin/sh -x
self=~/.conf;

#Test ln remover - only remove items if they are symlinks.
#Sanity checks to make sure they reside in a specific directory may be useful.
begon () {
	[ -L "$1" ] && rm "$1";
}

. $self/.begon
