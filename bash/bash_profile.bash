_confpath=~/.conf/common_shell
. $_confpath/functions.sh

# Interactive Login Shell or non-interactive shell
if [[ $- == *i* ]]
then
    __exists zsh && exec zsh
fi

. ~/.bashrc
#source /opt/twitter_mde/etc/bash_profile
# Automatically placed at end of file by MDE. To disable this behavior: touch ~/.no-mde-dotfile. Ideally you do not need to do this. Please contact mde-support@twitter.com to discuss long-term alternatives.
source /opt/twitter_mde/etc/bash_profile
