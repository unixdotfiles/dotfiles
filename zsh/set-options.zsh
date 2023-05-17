fpath=( /opt/local/share/zsh/site-functions $fpath ~/bin ~/bin/.zfunc/ )
fpath+=~/.conf/zsh/_zfunc
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U is-at-least

HISTFILE=~/.zsh_history
HISTSIZE=100100
SAVEHIST=100000
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

setopt LONG_LIST_JOBS

setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt complete_aliases
setopt extendedglob
is-at-least 5.2 && setopt GLOB_STAR_SHORT
unsetopt nomatch

setopt prompt_subst

# Speedy options
setopt hashcmds
setopt hashdirs

# when the shell exits keep background jobs.
unsetopt hup

setopt C_BASES

# Prevent overwriting existing files with '> filename', use '>| filename'
# (or >!) instead.
setopt noclobber

setopt BSD_ECHO
setopt COMBINING_CHARS # hide this behind a TERM check

zmodload zsh/datetime
zmodload zsh/mathfunc
zmodload zsh/termcap
autoload -Uz zcalc
autoload -Uz zmathfuncdef
