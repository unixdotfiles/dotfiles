__vcs_dir() {
	autoload -Uz vcs_info
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
#	PS1_VCS="%(1v.%F{green}%1v%f.)";		
	export PS1="[$PS1_HIST $PS1_USER@$PS1_HOST $PS1_WD $PS1_ERR%f]$PS1_PROMPT"
	RPROMPT="$PS1_VCS%f";

}

export PS2="%F{cyan}%F{blue}(%F{green}%_%F{blue})%F{cyan}%f ";

builtin cd $PWD
