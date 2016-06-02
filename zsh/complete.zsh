# A bit of explanation
# :completion:<func>:<completer>:<command>:<argument>:<tag>

# Enable Zsh completion
autoload -Uz compinit
zmodload zsh/complist
zmodload zsh/complete
compinit -i

# Enable Bash completion
autoload -Uz bashcompinit && bashcompinit

# show completion menu on succesive tab press
setopt auto_menu
setopt complete_in_word
setopt always_to_end

autoload -U zstyle+

#Some functions, are very slow.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' rehash true

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# Always complete one value (file name) only once in the current line.
zstyle ':completion:*' ignore-line other
zstyle ':completion:*:(mv|cp):*' ignore-line no
zstyle ':completion:*' single-ignored show

zstyle ':completion:*' verbose yes

zstyle ':completion:*' users root $USER eax eadler eitan jenkins git $__shellrc_extra_users

# quote pasted URLs
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
zstyle :urlglobber url-other-schema http https h2 h2c ftp git gopher magnet ssh

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Completing process IDs with menu selection:
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

zstyle ':completion:*:manuals' separate-sections true

# Don't complete remote files for faster git completion on large repos
__git_files () {
	_wanted files expl 'local files' _files
}

# Don't complete ./config.* files, this makes running ./configure much
# simpler. Thanks to Nomexous in #zsh on Freenode (2010-03-16 01:54 CET)
zstyle ':completion:*:*:-command-:*' ignored-patterns './config.*'
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"
zstyle ':completion:*:(ls|rm):*:(all-|)files' ignored-patterns
zstyle ':completion:*:*:vi(m|):*:*files' ignored-patterns '*?.(a|dylib|so|pyc|aux|dvi|ps|pdf|bbl|toc|lot|lof|o|cm)'
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

zstyle ':completion::complete:git-push:argument-1:' tag-order '! hosts' -
zstyle ':completion::complete:ldapsearch:*' tag-order '! globbed-files' -

#zstyle ':completion:*:*:[ak]dvi:*' file-patterns \
#    '*.dvi:dvi-files:DVI\ files *(-/):directories:Directories' '*:all-files'
#zstyle ':completion:*' file-patterns \
#    '%p:globbed-files: *(-/):directories:Directories' '*:all-files'

__exists git-last-modified && zstyle ':completion:*:*:git:*' user-commands last-modified:'shows when files were last modified'

__exists hub git && compdef hub=git
__exists gpg2 && ! (( $+_comps[gpg2] )) && compdef gpg2=gpg

compdef ll=ls
compdef lls=ls
