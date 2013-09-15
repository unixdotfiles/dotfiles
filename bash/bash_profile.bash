# Interactive Login Shell or non-interactive shell
if [[ $- == *i* ]]
then
	[ -e /usr/bin/zsh ] && exec /usr/bin/zsh
	[ -e /bin/zsh ] && exec /bin/zsh
	[ -e /usr/local/bin/zsh ] && exec /usr/local/bin/zsh
fi
source ~/.bashrc
