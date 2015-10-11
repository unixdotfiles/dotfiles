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
. $_confpath/options.sh
. $_confpath/env.sh
. $_confpath/start-tmux.sh
. $_confpath/aliases.sh
. $_shellpath/ps1.$__INTSHELL
[ "$TERM_PROGRAM" = "iTerm.app" ] && msource $_confpath/extra/iterm2_shell_integration.$__INTSHELL

for fle in $__rc_shell_files
do
  . $_shellpath/$fle.$__INTSHELL
done

# Used to work with a PATH unmodified by .options.post
CLEAN_PATH=$PATH

msource ~/.options.post
