#!/bin/sh

prepend="";
if [ "x$SSH_AUTH_SOCK" = "x" ]
then
	prepend="ssh-agent"
fi

if __exists tmux 
then
	# Don't let tmux run except in a child shell.
	# This allows me to run X outside of tmux and have
	# tmux run inside each tmux terminal
	if __inSSH
	then
		export FIRST_RUN="ready";
	fi
	if [ "x$FIRST_RUN" = "x" ]
	then
		export FIRST_RUN="ready";
	else
		if [ -z "$TMUX" ]
		then
			exec $prepend tmux
		fi
	fi
fi
return 0;
	if tmux has-session -t "$1";
	then
		tmux
#	if __inSSH
#		then
#			exec tmux attach-session -t "$1"
#		else
#			if [ "$TERM" != "screen" ]
#			then
#				#tmux new-window -t "$1"d
#				#exec tmux attach-session -t "$1"
#			fi
#		fi
	else
		tmux			
		exec tmux new-session -s "$1"
	fi
fi
