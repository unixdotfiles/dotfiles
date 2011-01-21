fpath=( $fpath ~/bin/zbin )
#umask 0077;

#History related options
HISTFILE=~/.zsh_history
HISTSIZE=10100
SAVEHIST=10000
setopt appendhistory
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_reduce_blanks
#setopt share_history


# correction/completion related options
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt complete_aliases
setopt extendedglob
setopt correct_all
unsetopt nomatch

#unsetopt check_jobs #don't warn me when I have jobs in the background
unsetopt hup #when the shell exits keep background jobs.
#setopt bsd_echo # make zsh echo act like bsd echo

bindkey -e

#export LC_ALL="en_US.UTF-8"
#export LANG="en_US.UTF-8"
