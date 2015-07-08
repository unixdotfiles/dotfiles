export _shellpath=~/.conf/zsh
export _confpath=~/.conf/common_shell

#Set some useful variables
__HOSTNAME="$(hostname)"
HOST="${__HOSTNAME%%.*}"

__INTSHELL="sh";
[ -n "$BASH_VERSION" ] && __INTSHELL="bash"
[ -n "$ZSH_VERSION" ] && __INTSHELL="zsh"

uname_s=$(uname -s)

source $_confpath/functions.sh
msource ~/.options.pre

msource /etc/environment
source $_confpath/env.sh
source $_confpath/start-tmux.sh
source $_confpath/aliases.sh
source $_confpath/extra/eval_spin.func
