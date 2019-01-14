#!/bin/sh
for shell in bash zsh
do
	curl https://iterm2.com/shell_integration/${shell} > ~/.conf/common_shell/extra/iterm2_shell_integration.$shell
done
