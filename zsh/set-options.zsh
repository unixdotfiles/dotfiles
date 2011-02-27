fpath=( $fpath ~/bin ~/bin/zbin )
#umask 0077;

#History related options
HISTFILE=~/.zsh_history
HISTSIZE=10100
SAVEHIST=10000
DIRSTACKSIZE=40

setopt hist_ignore_space

setopt extended_history

setopt hist_ignore_dups 
setopt hist_find_no_dups # don't show dups even if not contiguous
setopt hist_expire_dups_first

setopt appendhistory
setopt inc_append_history

setopt hist_verify
setopt no_hist_beep 

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
