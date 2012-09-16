# A bit of explanation
# :completion:<func>:<completer>:<command>:<argument>:<tag>

# Enable Completion

	autoload -U compinit
	zmodload -i zsh/complist
	compinit -i

# Global completion settings {{{

	zstyle ':completion:*' completer _complete _ignored
	zstyle :compinstall filename ~/.zshrc
	unsetopt flowcontrol
	setopt auto_menu         # show completion menu on succesive tab press
	setopt complete_in_word
	setopt always_to_end
	setopt rec_exact

#Some functions, are very slow. 
	zstyle ':completion:*' use-cache on
	zstyle ':completion:*' cache-path ~/.zsh/cache

# How fuzzy should we get? When should we display completions?

	#Fuzzy matching of completions for when you mistype them:
	zstyle ':completion:*' completer _complete _match _approximate
	zstyle ':completion:*:match:*' original only
	zstyle ':completion:*:approximate:*' max-errors 1 numeric

	#the number of errors allowed by _approximate increase with the length of what has been typed:
#	zstyle -e ':completion:*:approximate:*' \
#		max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

	# How do we display completions?

	zstyle ':completion:*:*:*:*:*' menu select
	zstyle ':completion:*' list-colors ''
	
	#Remove trailing slash of empty directory when completed
#	zstyle ':completion:*' squeeze-slashes true

	# case-insensitive (all),partial-word and then substring completion
	if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
	  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	  unset CASE_SENSITIVE
	else
	  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	fi

# What should _never_ correct?
	#ignore CVS paths - always
	#also ignore completer functions
	zstyle ':completion:*' ignored-patterns 'CVS' '*/CVS' 'CVS/*' '_*'
	zstyle ':completion:*:complete:-parameter-:*' ignored-patterns FIRST_RUN
	export FIGNORE="";

# }}}

# General commands {{{

## users {{{
zstyle ':completion:*:' users root $USER 

# }}}
# Particular commands

## cd {{{

#cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd
# }}}

## kill {{{

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
#Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

#}}}
#

## git {{{

# Don't complete remote files for faster git completion on large repos
__git_files () {
	_wanted files expl 'local files' _files
}

# }}}

## ps ##

zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

## ssh scp ##
# Load known hosts file for auto-completion with ssh and scp commands
if [ -f ~/.ssh/known_hosts ];
then
	zstyle ':completion:*:*:(ssh|scp|sftp|ping|ping6|host|dig|ftp|telnet):*:*' hosts $( sed -E -e 's/]/@/' -e 's/\[(.*)@.*[, ].*/\1/g' -e 's/[, ].*$//' ~/.ssh/known_hosts)
fi

## vim ##
zstyle ':completion:*:*:vi(m|):*:*files' ignored-patterns '*?.(aux|dvi|ps|pdf|bbl|toc|lot|lof|o|cm)'

# Always complete one value (file name) only once in the current line. This
# makes it easy to complete multiple values because I can just press tab to
# get all possible values. Otherwise I would have to skip the first value
# again and again.
zstyle ':completion:*' ignore-line yes
# Except for mv and cp, because I often want to use to similar names, so I
# complete to the same and change it.
zstyle ':completion:*:(mv|cp):*' ignore-line no
# Don't complete ./config.* files, this makes running ./configure much
# simpler. Thanks to Nomexous in #zsh on Freenode (2010-03-16 01:54 CET)
zstyle ':completion:*:*:-command-:*' ignored-patterns './config.*'


#this is correction - not completion - but ignore these too
CORRECT_IGNORE="_*"

#[ misc ]#######################################################################
zstyle ':completion:*:*:[ak]dvi:*' file-patterns \
    '*.dvi:dvi-files:DVI\ files *(-/):directories:Directories' '*:all-files'
zstyle ':completion:*:*:kghostview:*' file-patterns \
    '*.(ps|pdf)(|.gz|.bz2):pspdf-files:PostScript\ or\ PDF\ files *(-/):directories:Directories' '*:all-files'
zstyle ':completion:*:*:swfplayer:*' file-patterns \
    '*.swf:swf-files:Swf\ files *(-/):directories:Directories' '*:all-files'

zstyle ':completion:*' file-patterns \
    '%p:globbed-files: *(-/):directories:Directories' '*:all-files'


compdef _precommand verynice

