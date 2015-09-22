fpath=( $fpath ~/bin ~/bin/zbin )

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

# Job related options
setopt LONG_LIST_JOBS

setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt complete_aliases
setopt extendedglob
unsetopt nomatch

# Speedy options
setopt hashcmds
setopt hashdirs

# when the shell exits keep background jobs.
unsetopt hup

setopt C_BASES

# Prevent overwriting existing files with '> filename', use '>| filename'
# (or >!) instead.
setopt noclobber

zmodload zsh/mathfunc
zmodload zsh/termcap
