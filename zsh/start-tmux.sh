#!/bin/sh

__tmux_begin() {
	if __exists tmux && [ -z "$TMUX" ]
    then
        if ([ -n "$__zshrc_tmux_childonly" ] && [ -n "$__ZSHRC_FIRST_RUN" ]) ||
            [ -z "$__zshrc_tmux_childonly" ]
        then
            # If we want to automatically attach to existing session - do so
            [ -n "$__zshrc_auto_attach" ] && tmux has-session && exec tmux attach

            # If we want to start tmux normally, do so.
            exec tmux
        fi
    fi
}

[ -z "$__zshrc_tmux_disable" ] && __tmux_begin && __tmux_restore_env
export __ZSHRC_FIRST_RUN="ready";
