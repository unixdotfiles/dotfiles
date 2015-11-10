_confpath=~/.conf/common_shell
. $_confpath/functions.sh

# Interactive Login Shell or non-interactive shell
if [[ $- == *i* ]]
then
    __exists zsh && exec zsh
fi

. ~/.bashrc
#source /opt/twitter_mde/etc/bash_profile
