export BLOCKSIZE=K;
export EDITOR=vim;
export PAGER=less;
export READNULLCMD=$PAGER;

_CCACHE_PATH=/opt/local/libexec/ccache:/usr/local/libexec/ccache
_MACPORTS_PATH=/opt/local/sbin:/opt/local/bin
export PATH="$HOME/bin:$_CCACHE_PATH:$_MACPORTS_PATH:/usr/local/mysql/bin:$HOME/perl5/bin:$PATH"
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
CORRECT_IGNORE="_*";

export MANCOLOR="yes"; # view color data
export MANWIDTH="tty"; # view man pages in full width

export INPUTRC="~/.inputrc";

export ENV=~/.shrc;

if [ -n "$__shellrc_bgdaemons" ] && __exists gpg-agent && ! __isroot
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

if [ -n "$__shellrc_bgdaemons" ] && [ -z "$SSH_AUTH_SOCK" ] && ! __isroot
then
    eval $(ssh-agent) >/dev/null
fi

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
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYTHONIOENCODING=utf-8
export R_LIBS=~/.R

export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
__exists curl && __EC2_IID="$(curl -sf --connect-timeout .1 http://169.254.169.254/latest/meta-data/instance-id)"

# Show time(1) like information for long running commands
REPORTTIME=2
PERIOD=5
