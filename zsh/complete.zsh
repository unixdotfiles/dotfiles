# A bit of explanation
# :completion:<func>:<completer>:<command>:<argument>:<tag>

  # Enable Zsh completion
	autoload -U compinit
	zmodload zsh/complist
	zmodload zsh/complete
	compinit -i

  # Enable Bash completion
  autoload -U bashcompinit && bashcompinit

	setopt auto_menu         # show completion menu on succesive tab press
	setopt complete_in_word
	setopt always_to_end

	#Some functions, are very slow. 
	zstyle ':completion:*' use-cache on
	zstyle ':completion:*' cache-path ~/.zsh/cache

	zstyle ':completion:*' rehash true

	zstyle ':completion:*:*:*:*:*' menu select
	zstyle ':completion:*' list-colors ''
	
# Always complete one value (file name) only once in the current line.
zstyle ':completion:*' ignore-line other
zstyle ':completion:*:(mv|cp):*' ignore-line no
zstyle ':completion:*' single-ignored show

zstyle ':completion:*' verbose yes

zstyle ':completion:*:' users root $USER 

# quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
zstyle :urlglobber url-other-schema http https ftp git gopher magnet ssh

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

if [ -f ~/.ssh/known_hosts ];
then
	zstyle ':completion:*:*:(ssh|scp|sftp|ping|ping6|host|dig|ftp|telnet|drill):*:*' hosts $(sed -E -e 's/]/@/' -e 's/\[(.*)@.*[, ].*/\1/g' -e 's/[, ].*$//' ~/.ssh/known_hosts)
fi

# Don't complete ./config.* files, this makes running ./configure much
# simpler. Thanks to Nomexous in #zsh on Freenode (2010-03-16 01:54 CET)
zstyle ':completion:*:*:-command-:*' ignored-patterns './config.*'
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"
zstyle ':completion:*:(ls|rm):*:(all-|)files' ignored-patterns
zstyle ':completion:*:*:vi(m|):*:*files' ignored-patterns '*?.(a|dylib|so|pyc|aux|dvi|ps|pdf|bbl|toc|lot|lof|o|cm)'
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Don't complete arbitrary hosts for git push
zstyle :completion::complete:git-push:argument-1: tag-order '! hosts' -

#zstyle ':completion:*:*:[ak]dvi:*' file-patterns \
#    '*.dvi:dvi-files:DVI\ files *(-/):directories:Directories' '*:all-files'
#zstyle ':completion:*' file-patterns \
#    '%p:globbed-files: *(-/):directories:Directories' '*:all-files'

__exists hub && __exists git && compdef hub=git
__exists gpg2 && ! (( $+_comps[gpg2] )) && compdef gpg2=gpg

compdef ll=ls
compdef lls=ls
