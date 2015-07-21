export _confpath=~/.conf/common_shell

#Set some useful variables
__HOSTNAME="$(hostname)"
HOST="${__HOSTNAME%%.*}"

__INTSHELL="sh";
[ -n "$BASH_VERSION" ] && __INTSHELL="bash"
[ -n "$ZSH_VERSION" ] && __INTSHELL="zsh"
export _shellpath=~/.conf/$__INTSHELL

uname_s=$(uname -s)

. $_confpath/functions.sh
msource ~/.options.pre

msource /etc/environment
. $_confpath/env.sh
. $_confpath/start-tmux.sh
. $_confpath/aliases.sh
. $_confpath/extra/eval_spin.func
. $_shellpath/ps1.$__INTSHELL