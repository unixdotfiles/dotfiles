export _shellpath=~/.conf/zsh
export _confpath=~/.conf/common_shell

#Set some useful variables
__HOSTNAME="$(hostname)"
HOST="${__HOSTNAME%%.*}"

source $_confpath/functions.sh
msource /etc/environment

source $_confpath/env.sh

export _confpath=~/.conf/zsh
