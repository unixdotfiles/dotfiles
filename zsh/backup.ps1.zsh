__vcs_dir() {
	local vcs ref
	svn_dir() {
      	[ -d ".svn" ] || return 1
        	ref=$(svn info . | awk '/^Revision/ { sub("[^0-9]*","",$0); print r":"$0}')
        	vcs="svn"
      }
  	svn_dir || echo "";
	echo "${vcs:+[$vcs}${vcs:+$ref]}"
}

#some settings
PS1_USER="%{$fg[blue]%}%n";			#my username
PS1_HOST="%{$fg[blue]%}%m";			#hostname
PS1_ERR="%{$fg[red]%}%(?..!%?!)";  		#return code of last command (if it was not 0)
PS1_WD="%{$fg[magenta]%}%35<...<%~";	#current working directory
PS1_PROMPT="%#";					#EOF

function chpwd()
{
	PS1_VCS="%{$fg[green]%}$(__vcs_dir)";	#info about the vcs
	PS1="[$PS1_USER@$PS1_HOST $PS1_WD $PS1_VCS $PS1_ERR%{$reset_color%}]$PS1_PROMPT"

}

cd $PWD;
