#!/bin/sh

__tmux_begin() {
	if __exists tmux && [ -z "$TMUX" ] && ! __isroot
    then
        if ([ -n "$__shellrc_tmux_childonly" ] && [ -n "$__SHELLRC_FIRST_RUN" ]) ||
            [ -z "$__shellrc_tmux_childonly" ]
        then
            # If we want to automatically attach to existing session - do so
            [ -n "$__shellrc_noauto_attach" ] && tmux has-session && exec tmux attach

            # If we want to start tmux normally, do so.
            exec tmux
        fi
    fi
}

[ -z "$__shellrc_tmux_disable" ] && __tmux_begin && __tmux_restore_ssh_env
export __SHELLRC_FIRST_RUN="ready";
