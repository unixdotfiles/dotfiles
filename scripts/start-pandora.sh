#!/bin/sh

unset TMUX

if tmux has-session -t music 2>/dev/null
then
else
	tmux new-session -d -s music -n pandora pianobar
fi

