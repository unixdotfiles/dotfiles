#!/bin/sh

__permit_free_tmux() {
	__inSSH && return 0;
	[ $(uname -s) = "Darwin" ] && return 0;

	false
}

__prepend_begin() {
	local prepend
	prepend=""
	if [ -z "$SSH_AUTH_SOCK" ]
	then
		prepend="ssh-agent"
	fi

	# Don't let tmux run except in a child shell.
	# This allows me to run X outside of tmux and have
	# tmux run inside each tmux terminal
	if __exists tmux
	then
		if [ -n "$FIRST_RUN" ] || __permit_free_tmux
		then
			if [ -z "$TMUX" ]
			then
				exec $prepend tmux
			fi
		else
			export FIRST_RUN="ready";
		fi
	fi
}

[ -z "$__zshrc_prepend_disable" ] && __prepend_begin
