#!/bin/sh

__tmux_begin() {
	# Don't let tmux run except in a child shell.
	# This allows me to run X outside of tmux and have
	# tmux run inside each tmux terminal
	if __exists tmux && [ -n "$__ZSHRC_FIRST_RUN" ] && [ -z "$TMUX" ]
    then
        exec tmux
    else
        export __ZSHRC_FIRST_RUN="ready";
	fi
}

if [ -z "$SSH_AUTH_SOCK" ]
then
    eval $(ssh-agent)
fi

[ -z "$__zshrc_tmux_disable" ] && __tmux_begin
