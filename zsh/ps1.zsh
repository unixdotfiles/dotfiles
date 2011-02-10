autoload -Uz vcs_info
zstyle ':vcs_info:hg*:' use-simple true 
zstyle ':vcs_info:*' enable svn git hg cvs
# [ formats ] 
#zstyle ':vcs_info:*' formats "%b%c%u"
#zstyle ':vcs_info:*' disable cdv darcs mtn p4 svk tla git-p4 git-svn bzr
######edit    zstyle ':vcs_info:*' actionformats "%b%c%u|%a"
#zstyle ':vcs_info:*' branchformat "%b:%r"
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:hg*:' get-revision false
zstyle ':vcs_info:git*:' get-revision false

# [ stagedstr ]
# This string will be used in the %c escape if there are staged changes in the repository. 
zstyle ':vcs_info:*' stagedstr "+"
# [ unstagedstr ]
# This string will be used in the %u escape if there are unstaged changes in the repository. 
zstyle ':vcs_info:*' unstagedstr "!"

zstyle ':vcs_info:p4*:' use-server false

__vcs_dir() {
	vcs_info
	echo $vcs_info_msg_0_;
}

#some settings
PS1_HIST="%!";				#history
PS1_USER="%F{blue}%n";			#my username
if __inSSH
then
	PS1_HOST="%B%F{blue}%m%b"
else
	PS1_HOST="%F{blue}%m";			#hostname
fi
PS1_ERR="%F{red}%(?..!%?!)";  		#return code of last command (if it was not 0)
PS1_WD="%F{magenta}%30<...<%~";	#current working directory limited to 30 chars
PS1_PROMPT="%#";					#EOF

function setCurrentPS1()
{
	PS1_VCS="%F{green}$(__vcs_dir)";	#info about the vcs
	PS1="[$PS1_HIST $PS1_USER@$PS1_HOST $PS1_WD $PS1_ERR%f]$PS1_PROMPT"
	RPS1="$PS1_VCS%f";

}

export PS2="%F{cyan}%F{blue}(%F{green}%_%F{blue})%F{cyan}%f ";

builtin cd $PWD
