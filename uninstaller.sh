#! /bin/sh -x
self=$(realpath ~/.conf);

#Test ln. only link if the second argument doesn't exist
begon () {
	[ -L "$1" ] && rm "$1";
}

. $self/.begon 
