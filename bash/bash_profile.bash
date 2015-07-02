confpath=~/.conf/zsh/
. $confpath/functions.sh

# Interactive Login Shell or non-interactive shell
if [[ $- == *i* ]]
then
    __exists zsh && exec zsh
fi

. ~/.bashrc
