export _shellpath=~/.conf/zsh
export _confpath=~/.conf/common_shell

#Set some useful variables
__HOSTNAME="$(hostname)"
HOST="${__HOSTNAME%%.*}"

uname_s=$(uname -s)

source $_confpath/functions.sh
msource /etc/environment

source $_confpath/env.sh
source $_confpath/extra/eval_spin.func
