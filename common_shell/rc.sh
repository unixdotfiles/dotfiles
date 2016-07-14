export _confpath=~/.conf/common_shell

#Set some useful variables
__HOSTNAME="$(hostname -s)"

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
. $_shellpath/ps1.$__INTSHELL
[ "$TERM_PROGRAM" = "iTerm.app" ] && msource $_confpath/extra/iterm2_shell_integration.$__INTSHELL

msource /Users/eax/Library/Python/2.7/bin/virtualenvwrapper.sh

for fle in $__rc_shell_files
do
  . $_shellpath/$fle.$__INTSHELL
done

msource ~/bin/submodules/arcanist/resources/shell/bash-completion

msource ~/.options.post
