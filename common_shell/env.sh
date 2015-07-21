export BLOCKSIZE=K;
export EDITOR=vim;
export PAGER=less;

export PATH="$HOME/bin:/usr/local/libexec/ccache:/opt/local/bin:/opt/local/sbin:$PATH:$HOME/svn/arcanist/bin";
export CCACHE_PATH=/usr/local/bin:/usr/bin
export CCACHE_DIR=/cache/ccache
export FORTUNE_PATH="/usr/share/games/fortune:/usr/local/share/games/fortune:$HOME/.fortune";

__exists chrome && export BROWSER=$(which chrome)
__exists google-chrome && export BROWSER=$(which google-chrome)
__exists firefox && export BROWSER=$(whereis -qbx firefox)
__exists urxvtcd && export TERMINAL=urxvtcd

#export LSCOLORS="Gxfxcxdxbxegedabagacad"

export XZ_OPT="-9eM 90%";
export GZIP="-9";
export GREP_OPTIONS="--color"

export CHARSET="UTF-8";

#Yes GTK - I really do want you to listen to my config file
export GTK_IM_MODULE="xim";

#Specific to ZSH - but this is an envrioment variable so meh
export CORRECT_IGNORE="_*";

export MANCOLOR="yes"; # view color data
export MANWIDTH="tty"; # view man pages in full width

export INPUTRC="~/.inputrc";

export ENV=~/.shrc;

if __exists gpg-agent
then
	if ! __isroot
	then
		if [ -f ~/.gpg-agent-info ]
		then
			. ~/.gpg-agent-info
			export GPG_AGENT_INFO
		fi
		if ! gpg-agent -q >/dev/null 2>&1
		then
			eval $(gpg-agent --daemon)
		fi
	fi
fi

if [ -z "$SSH_AUTH_SOCK" ] && ! __isroot
then
    eval $(ssh-agent) >/dev/null
fi

export AUDIODEV=/dev/dsp2.0

if [ "$uname_s" = "FreeBSD" ]
then
    export GOOS=freebsd
    export GOARCH=amd64
    export GOROOT=/usr/local/go
fi

export DICTIONARY=en_US

export P4DIFF="diff -u"

export PL_SVN_IGNORE=1

export LANG=en_US.UTF-8

export CONF_PATH=~/.conf/

export MYSQL_PS1="\c \u@\h:\p [\d]>"

export WORKON_HOME=~/.ve