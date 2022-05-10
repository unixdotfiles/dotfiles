export BLOCKSIZE=K;
export EDITOR=nvim;
export PAGER=less;
export LESS="-iRM";
export READNULLCMD=$PAGER;

_LOCAL_PATH=/usr/local/bin
_CCACHE_PATH=/opt/local/libexec/ccache:/usr/local/libexec/ccache
_HASKELL_PATH=/Users/eax/.local/bin
_MACPORTS_PATH=/opt/local/sbin:/opt/local/bin
_NPM_PATH=~/.local/lib/npm/bin
_GEM_PATH=~/.gem/ruby/2.6.0/bin:~/.rvm/bin
_USER_PIP_PATH="$_PRIMARY_PIP_PATH"
_PEAR_PATH=/opt/local/bin/pear
_CARGO_PATH=~/.cargo/bin
_MYSQL_PATH=/opt/local/lib/mariadb-10.2/bin:/usr/local/mysql/bin
_ANDROID_PATH=~/Library/Android/sdk/platform-tools
_PERL_PATH=/opt/local/libexec/perl5.28/sitebin
_LUA_PATH=~/.luarocks/bin
for whichvscode in '/Applications/Visual Studio Code/Contents/Resources/app/bin' '/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin'
do
  if [ -d "$whichvscode" ]
  then
    _VSCODE_PATH="$whichvscode"
  fi
done

if [ -d /usr/local/texlive/2020/bin/x86_64-darwin ]
then
  _TEX_PATH=/usr/local/texlive/2020/bin/x86_64-darwin
fi
export PATH="$PATH:$HOME/bin:$_CCACHE_PATH:$_CARGO_PATH:$_HASKELL_PATH:$_NPM_PATH:$_GEM_PATH:$_USER_PIP_PATH:$_MACPORTS_PATH:$_PEAR_PATH:$_MYSQL_PATH:$_PERL_PATH:$_ANDROID_PATH:$_LUA_PATH:$_TEX_PATH:$_VSCODE_PATH:$_LOCAL_PATH"
export CCACHE_DIR=/srv/obj/ccache
export FORTUNE_PATH="/usr/share/games/fortune:/usr/local/share/games/fortune:$HOME/.fortune";

if [ -z "${JAVA_HOME}" ]
then
  [ -e /usr/libexec/java_home ] && export JAVA_HOME=$(/usr/libexec/java_home -v ${__shellrc_java_ver:-16})
fi

__exists chrome && export BROWSER="$(which chrome)"
__exists google-chrome && export BROWSER="$(which google-chrome)"
__exists firefox && export BROWSER="$(which firefox)"
[ -e /Applications/Firefox.app/Contents/MacOS/firefox ] && export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"
__exists urxvtcd && export TERMINAL=urxvtcd

[ -d /opt/local/share/cowsay/cows ] && export COWPATH="/opt/local/share/cowsay/cows"
[ -d ~/svn/cowsay-files/cows ] && export COWPATH="$COWPATH:$(realpath ~/svn/cowsay-files/cows)"

export XZ_OPT="-9eM 90%";

export CHARSET="UTF-8";

#Yes GTK - I really do want you to listen to my config file
export GTK_IM_MODULE="xim";

export MANCOLOR="yes"; # view color data
export MANWIDTH="tty"; # view man pages in full width

export INPUTRC=~/.inputrc;

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
    eval "$(gpg-agent --daemon)"
  fi
fi

if [ -n "$__shellrc_bgdaemons" ] && [ -z "$SSH_AUTH_SOCK" ] && ! __isroot
then
    eval "$(ssh-agent)" >/dev/null
fi

if [ "$_uname_s" = "FreeBSD" ]
then
    export GOOS=freebsd
    export GOARCH=amd64
    export GOROOT=/usr/local/go
fi

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

export DICTIONARY=en_US
export P4DIFF="diff -u"
export LANG=en_US.UTF-8
export CONF_PATH=~/.conf/
export MYSQL_PS1="\c \u@\h:\p [\d]>"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYTHONCOERCECLOCALE=warn
export PYTHONFAULTHANDLER=1
export PYTHONWARNINGS="default::DeprecationWarning,default::PendingDeprecationWarning,ignore::ImportWarning"
export R_LIBS=~/.R
export CVS_RSH="ssh"
_OSX_JPM_FX_BINARY='/Applications/FirefoxDeveloperEdition.app/Contents/MacOS/firefox-bin'
[ -f "$_OSX_JPM_FX_BINARY" ] && export JPM_FIREFOX_BINARY="$_OSX_JPM_FX_BINARY"
export MTR_OPTIONS="-b -e"

export JVM_DEBUG_ARGS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"

export RUST_BACKTRACE=1
export CG_CONTEXT_SHOW_BACKTRACE=1 # macOS
export RAKUDO_BACKTRACE=1 # Perl 6
export NANO_NOCATCH=1

# electron apps
export SLACK_DEVELOPER_MENU=true

# ripgrep does not have a default. Instead it must be set explicitly.
export RIPGREP_CONFIG_PATH="$HOME/.conf/ripgrep/ripgrep.rc"

# __exists curl && __EC2_IID="$(curl -sf --connect-timeout .1 http://169.254.169.254/latest/meta-data/instance-id)"

#Specific to ZSH - but these are envrioment variables so meh
CORRECT_IGNORE="_*";
# Show time(1) like information for long running commands
TIMEFMT="%J %U user %S system %P cpu %*E total; max RSS %MKi"
REPORTTIME=2
PERIOD=5

ulimit -c unlimited
ulimit -n 1024
