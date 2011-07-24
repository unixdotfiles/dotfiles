#!/bin/sh

prepend="";
if [ "x$SSH_AUTH_SOCK" = "x" ]
then
	prepend="ssh-agent"
fi

if __exists tmux 
then
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
		#I'm in tmux already about to start a new shell (likely)
		tmux			
		exec tmux new-session -s "$1"
	fi
fi

