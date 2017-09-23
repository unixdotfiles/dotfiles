#!/bin/sh
for shell in bash zsh
do
	curl https://iterm2.com/misc/${shell}_startup.in > ~/.conf/common_shell/extra/iterm2_shell_integration.$shell
done
