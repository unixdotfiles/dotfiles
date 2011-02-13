#used for interactive shells
if [ -t 0 ]
then
	[ -e /usr/bin/zsh ] && exec /usr/bin/zsh
	[ -e /bin/zsh ] && exec /bin/zsh
	[ -e /usr/local/bin/zsh ] && exec /usr/local/bin/zsh
fi

use="all"
confpath=~/.conf/zsh/

#Set some useful variables
HOST="$(hostname)"

source $confpath/inSSH.func
source $confpath/exists.func
source $confpath/env.sh
source $confpath/aliases.sh
source $confpath/eval_spin.func
source $confpath/portsnap.zfunc
	
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH:${HOME}/bin
export ANSI_COLOR_BLACK="\e[0;30m"
export ANSI_COLOR_RED="\e[0;31m"
export ANSI_COLOR_GREEN="\e[0;32m"
export ANSI_COLOR_YELLOW="\e[0;33m"
export ANSI_COLOR_BLUE="\e[0;34m"
export ANSI_COLOR_MAGENTA="\e[0;35m"
export ANSI_COLOR_CYAN="\e[0;36m"
export ANSI_COLOR_LIGHT_GRAY="\e[0;37m"
export ANSI_COLOR_DEFAULT="\e[0;39m"
export ANSI_BGCOLOR_BLACK="\e[47m"
export ANSI_BGCOLOR_BLUE="\e[44m"
export ANSI_BGCOLOR_GREEN="\e[42m"
export ANSI_BGCOLOR_CYAN="\e[46m"
export ANSI_BGCOLOR_RED="\e[41m"
export ANSI_BGCOLOR_MAGENTA="\e[45m"
export ANSI_BGCOLOR_YELLOW="\e[43m"
export ANSI_BGCOLOR_DEFAULT="\e[49m"
export ANSI_RESET="\e[m"
export ANSI_BOLD="\e[1m"
export ANSI_UNDERLINE="\e[4m"
export ANSI_INVERSE="\e[7m"
export ANSI_BLINK="\e[5m"
export ANSI_COLOR_DARK_GRAY="\e[1;30m"
export ANSI_COLOR_LIGHT_RED="\e[1;31m"
export ANSI_COLOR_LIGHT_GREEN="\e[1;32m"
export ANSI_COLOR_LIGHT_YELLOW="\e[1;33m"
export ANSI_COLOR_LIGHT_BLUE="\e[1;34m"
export ANSI_COLOR_LIGHT_MAGENTA="\e[1;35m"
export ANSI_COLOR_LIGHT_CYAN="\e[1;36m"
export ANSI_COLOR_WHITE="\e[1;37m"
export PS1="\[${ANSI_BOLD}${ANSI_COLOR_YELLOW}\]\t \[${ANSI_COLOR_LIGHT_BLUE}\]\u\[${ANSI_COLOR_RED}\]@\[${ANSI_COLOR_GREEN}\]\h\[${ANSI_COLOR_LIGHT_YELLOW}\]:\w \$ \[${ANSI_RESET}\]"

#some settings
PS1_USER="${ANSI_COLOR_BLUE}\u";              #my username
if __inSSH
then
      PS1_HOST="${ANSI_BOLD}${ANSI_COLOR_BLUE}\h${ANSI_RESET}${ANSI_BOLD}"
else
      PS1_HOST="${ANSI_COLOR_BLUE}\h${ANSI_RESET}";              #hostname
fi
PS1_WD="${ANSI_COLOR_MAGENTA}\w";     #current working directory
PS1_PROMPT="\$";                          #EOF

export PS1="[\! $PS1_USER@$PS1_HOST $PS1_WD ${ANSI_RESET}]$PS1_PROMPT"



