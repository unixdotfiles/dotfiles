export BLOCKSIZE=K;
export EDITOR=vim;
export PAGER=less;
#export LESS="-RMj5"

export PATH="/usr/local/libexec/ccache:/opt/local/bin:/opt/local/sbin:$PATH:$HOME/bin:$HOME/svn/arcanist/bin";
export CCACHE_PATH=/usr/local/bin:/usr/bin
export CCACHE_DIR=/cache/ccache
export FORTUNE_PATH="/usr/share/games/fortune:/usr/local/share/games/fortune:$HOME/.fortune";

#export MANPATH=/opt/local/share/man:$MANPATH

#top default arguments
export TOP="-IC";
#grep default options
export GREP_OPTIONS="--color"

__exists chrome && export BROWSER=$(which chrome)
__exists google-chrome && export BROWSER=$(which google-chrome)
__exists firefox && export BROWSER=$(whereis -qbx firefox)
__exists urxvtcd && export TERMINAL=urxvtcd

#export LSCOLORS="Gxfxcxdxbxegedabagacad"

export XZ_OPT="-9eM 90%";
export GZIP="-9";

#export TZ="EST";
export CHARSET="UTF-8";

#Yes GTK - I really do want you to listen to my config file
export GTK_IM_MODULE="xim";

#Specific to ZSH - but this is an envrioment variable so meh
export CORRECT_IGNORE="_*";

## Git specific things
GIT_AUTHOR_NAME="Eitan Adler";
GIT_AUTHOR_EMAIL="lists@eitanadler.com";

export MANCOLOR="yes"; # view color data
export MANWIDTH="tty"; # view man pages in full width

export TINDY="/usr/local/tinderbox/";

export INPUTRC="~/.inputrc";

export ENV=~/.shrc;

# GPG Agent --daemon should be here somewhere

if __exists gpg-agent
then
	if [ $UID != 0 ]
	then
		if [ -f ~/.gpg-agent-info ]
		then
			. ~/.gpg-agent-info
			export GPG_AGENT_INFO
		fi
		if ! gpg-agent -q >/dev/null 2>&1
		then
			eval $(gpg-agent --write-env-file ~/.gpg-agent-info --daemon)
		fi
	fi
fi

export AUDIODEV=/dev/dsp2.0

export GOOS=freebsd
export GOARCH=amd64
export GOROOT=/usr/local/go

export DICTIONARY=en_US

export P4DIFF="diff -u"

export PL_SVN_IGNORE=1

export LANG=en_US.UTF-8

export CONF_PATH=~/.conf/

export GOPATH=~/goprojects/
