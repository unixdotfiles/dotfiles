autoload -Uz vcs_info
zstyle ':vcs_info:*:' use-simple false
zstyle ':vcs_info:*' enable svn git hg cvs p4 
# [ formats ] 
#zstyle ':vcs_info:*' formats "%b%c%u"
#zstyle ':vcs_info:*' disable cdv darcs mtn svk tla git-p4 bzr
#zstyle ':vcs_info:*' branchformat "%b:%r"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-mq true
zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' hgrevformat "%r:%h"
zstyle ':vcs_info:hg*:*' branchformat "%b" # no %r
zstyle ':vcs_info:hg*:*' patchformat "%p%u%n%c%a%g%G"
zstyle ':vcs_info:hg*:*' nopatchformat "%p%u%n%c%a%g%G"
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "!"

__VCS_SCM="%F{magenta}(%f%s:%r%F{magenta})"
__VCS_BRANCH="%F{green}%b%u%c%f"
__VCS_REV="%i"
__VCS_ACTION="%F{3}|%F{1}%a"
__VCS_FORMATS="$__VCS_SCM%F{red}-%F{magenta}[$__VCS_BRANCH%F{magenta}$__VCS_FORMAT%F{magenta}]%f-[$__VCS_REV]%f" # no %m
__VCS_ACTION_FORMATS="$__VCS_SCM%F{red}-%F{magenta}[$__VCS_BRANCH%F{magenta}$__VCS_FORMAT$__VCS_ACTION%F{magenta}]%f-[$__VCS_REV]%f"

zstyle ':vcs_info:*' formats      "$__VCS_FORMATS"
zstyle ':vcs_info:*' actionformats "$__VCS_ACTION_FORMATS"


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

export PS1_VIM="%F{green}${VIMRUNTIME:+vim}%f"

function setCurrentPS1()
{
	PS1_BATTERY=""
	[ -n "$__SHOW_BSD_BATTERY" ] && PS1_BATTERY="%F{yellow}($(sysctl -n hw.acpi.battery.life)%%)"
	PS1_VCS="%F{green}$(__vcs_dir)";	#info about the vcs
	PS1="[$PS1_HIST $PS1_USER@$PS1_HOST $PS1_BATTERY $PS1_WD $PS1_ERR%f]$PS1_PROMPT"
	RPS1_TIMER=""
	if [ $__cmd_exec_timer ]
	then
		__cmd_exec_timediff="$(($SECONDS - $__cmd_exec_timer))"
		if [ $__cmd_exec_timediff -gt 2 ]
		then
			RPS1_TIMER="%F{cyan}${__cmd_exec_timediff}s%f "
		fi
		unset __cmd_exec_timer
	fi
	RPS1="$RPS1_TIMER${VIMRUNTIME:+"{$PS1_VIM}"}$PS1_VCS%f";
}

function setExecutionTimer() {
	__cmd_exec_timer=${__cmd_exec_timer:-$SECONDS}
}

export PS2="%F{cyan}%F{blue}(%F{green}%_%F{blue})%F{cyan}%f ";

# Colorize stderr in red
#OBexec 2>>(while read -r -k -u 0 line; do
#    printf '\e[91m%s\e[0m' "$line";
#	    print -n $'\0';
#	done &)
#
