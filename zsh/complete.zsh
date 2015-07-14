# A bit of explanation
# :completion:<func>:<completer>:<command>:<argument>:<tag>

# Enable Completion

	autoload -U compinit
	zmodload -i zsh/complist
	compinit -i

# Global completion settings {{{

	setopt auto_menu         # show completion menu on succesive tab press
	setopt complete_in_word
	setopt always_to_end

	#Some functions, are very slow. 
	zstyle ':completion:*' use-cache on
	zstyle ':completion:*' cache-path ~/.zsh/cache

	zstyle ':completion:*' rehash true

	#Fuzzy matching of completions for when you mistype them:
#	zstyle ':completion:*' completer _complete _match _approximate
#	zstyle ':completion:*:match:*' original only
#	zstyle ':completion:*:approximate:*' max-errors 1 numeric
#
	# How do we display completions?

	zstyle ':completion:*:*:*:*:*' menu select
	zstyle ':completion:*' list-colors ''
	
	# case-insensitive (all),partial-word and then substring completion
#	if [ "$CASE_SENSITIVE" = "true" ]; then
#	  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#	  unset CASE_SENSITIVE
#	else
#	  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#	fi
#	export FIGNORE="";

	# Always complete one value (file name) only once in the current line.
	# makes it easy to complete multiple values because I can just press rab to
	# get all possible values. Otherwise I would have to skip the first value
	# again and again.
	zstyle ':completion:*' ignore-line yes

	# quote pasted URLs
	autoload -U url-quote-magic
	zle -N self-insert url-quote-magic

# }}}

# General commands {{{

zstyle ':completion:*:' users root $USER 

# Particular commands

#cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
#Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Don't complete remote files for faster git completion on large repos
__git_files () {
	_wanted files expl 'local files' _files
}

## ps ##
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

## ssh scp ##
# Load known hosts file for auto-completion with ssh and scp commands
if [ -f ~/.ssh/known_hosts ];
then
	zstyle ':completion:*:*:(ssh|scp|sftp|ping|ping6|host|dig|ftp|telnet):*:*' hosts $( sed -E -e 's/]/@/' -e 's/\[(.*)@.*[, ].*/\1/g' -e 's/[, ].*$//' ~/.ssh/known_hosts)
fi

## vim ##
zstyle ':completion:*:*:vi(m|):*:*files' ignored-patterns '*?.(a|dylib|so|pyc|aux|dvi|ps|pdf|bbl|toc|lot|lof|o|cm)'

# Except for mv and cp, because I often want to use to similar names, so I
# complete to the same and change it.
zstyle ':completion:*:(mv|cp):*' ignore-line no
# Don't complete ./config.* files, this makes running ./configure much
# simpler. Thanks to Nomexous in #zsh on Freenode (2010-03-16 01:54 CET)
zstyle ':completion:*:*:-command-:*' ignored-patterns './config.*'
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"
zstyle ':completion:*:ls:*:(all-|)files' ignored-patterns
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns

#[ misc ]#######################################################################
#zstyle ':completion:*:*:[ak]dvi:*' file-patterns \
#    '*.dvi:dvi-files:DVI\ files *(-/):directories:Directories' '*:all-files'
#zstyle ':completion:*:*:kghostview:*' file-patterns \
#    '*.(ps|pdf)(|.gz|.bz2):pspdf-files:PostScript\ or\ PDF\ files *(-/):directories:Directories' '*:all-files'
#zstyle ':completion:*:*:swfplayer:*' file-patterns \
#    '*.swf:swf-files:Swf\ files *(-/):directories:Directories' '*:all-files'
#
#zstyle ':completion:*' file-patterns \
#    '%p:globbed-files: *(-/):directories:Directories' '*:all-files'

compdef _precommand verynice
__exists hub && __exists git && compdef hub=git
__exists gpg2 && ! (( $+_comps[gpg2] )) && compdef gpg2=gpg
