#!/bin/sh
if __exists tmux 
then
	if tmux has-session -t "$1";
	then
		if __inSSH
		then
			exec tmux attach-session -t "$1"
		else
			if [ "$TERM" != "screen" ]
			then
				#tmux new-window -t "$1"d
				#exec tmux attach-session -t "$1"
			fi
		fi
	else
		exec tmux new-session -s "$1"
	fi
fi