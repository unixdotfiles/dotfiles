#!/bin/sh
if __exists tmux 
then
	if [ "x$TMUX" == "x" ]
	then
		if __inSSH
		then
			if tmux has-session -t "$1";
			then
				tmux attach-session -t "$1";
			else
				exec tmux new-session -s "$1";
				#tmux new-window -t "$1";
				#exec tmux attach-session -t "$1";
			fi
		else
			exec tmux new-session -s "$1";
		fi
	else
		#I'm in tmux already about to start a new shell (likely)
	fi
fi

