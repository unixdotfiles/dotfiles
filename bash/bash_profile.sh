return
if [ -t 0 ]
then
	[ -e /usr/bin/zsh ] && exec /usr/bin/zsh
	[ -e /bin/zsh ] && exec /bin/zsh
	[ -e /usr/local/bin/zsh ] && exec /usr/local/bin/zsh
fi


