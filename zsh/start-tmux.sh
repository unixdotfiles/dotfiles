#!/bin/sh

__tmux_begin() {
	# Don't let tmux run except in a child shell.
	# This allows me to run X outside of tmux and have
	# tmux run inside each tmux terminal

	if __exists tmux && ! [ -z "$__ZSHRC_FIRST_RUN" -a -n "$__zshrc_tmux_childonly" ] && [ -z "$TMUX" ]
    then
        # If we want to automatically attach to existing session - do so
        [ -n "$__zshrc_auto_attach" ] && tmux has-session && exec tmux attach

        # If we want to start tmux normally, do so.
        exec tmux
    fi
    export __ZSHRC_FIRST_RUN="ready";
}

[ -z "$__zshrc_tmux_disable" ] && __tmux_begin
