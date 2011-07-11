#!/bin/sh
if __exists tmux 
then
	if [ "x$TERM" != "xscreen" ]
	then
		exec tmux
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
