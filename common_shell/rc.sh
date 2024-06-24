export _confpath=~/.conf/common_shell

#Set some useful variables
__HOSTNAME="$(hostname -s)"

__INTSHELL="sh";
[ -n "$BASH_VERSION" ] && __INTSHELL="bash"
[ -n "$ZSH_VERSION" ] && __INTSHELL="zsh"
export _shellpath=~/.conf/$__INTSHELL

_uname_s=$(uname -s)

# /opt/homebrew/bin/virtualenvwrapper_lazy.sh
for v in 3 3.10 3.11 3.12 3.13 3.14 3.15 3.16 3.17 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0
do
  if [ -e "$HOME/Library/Python/$v/bin" ]
  then
    _PRIMARY_PIP_PATH="$HOME/Library/Python/$v/bin"
  elif [ -e "/opt/homebrew/bin/pip${v}" ]
  then
    _PRIMARY_PIP_PATH="/opt/homebrew/bin"
  fi
done
if [ -z "$_PRIMARY_PIP_PATH" ] && [ -e ~/.local/bin ]
then
  _PRIMARY_PIP_PATH=~/.local/bin
fi

. $_confpath/functions.sh
msource ~/.options.pre

msource /etc/environment
. $_confpath/env.sh
. $_confpath/start-tmux.sh
. $_confpath/aliases.sh
. $_shellpath/ps1.$__INTSHELL
msource  "$HOME/miniconda3/etc/profile.d/conda.sh"
msource "$HOME/.sdkman/bin/sdkman-init.sh"
if [ -n "$ITERM_SESSION_ID" ]
then
  . $_confpath/extra/iterm2_shell_integration.$__INTSHELL
fi
msource /Users/eax/.travis/travis.sh

msource "$_PRIMARY_PIP_PATH/virtualenvwrapper_lazy.sh"

for fle in $__rc_shell_files
do
  . $_shellpath/$fle.$__INTSHELL
done

msource ~/.options.post
