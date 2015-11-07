autoload -Uz vcs_info
zstyle ':vcs_info:*:' use-simple false
zstyle ':vcs_info:*' enable svn git hg cvs p4 
# [ formats ] 
#zstyle ':vcs_info:*' disable cdv darcs mtn svk tla git-p4 bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-mq true
zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' hgrevformat "%r:%h"
zstyle ':vcs_info:hg*:*' branchformat "%b" # no %r
zstyle ':vcs_info:hg*:*' patchformat "%p%u%n%c%a%g%G"
zstyle ':vcs_info:hg*:*' nopatchformat "%p%u%n%c%a%g%G"
zstyle ':vcs_info:*' stagedstr "%F{red}●%f"
zstyle ':vcs_info:*' unstagedstr "%F{yellow}●%f"

__VCS_SCM="%F{magenta}(%f%s:%r%F{magenta})"
__VCS_BRANCH="%F{green}%b%u%c%f"
__VCS_REV="%i"
__VCS_ACTION="%F{3}|%F{1}%a"
__VCS_FORMATS="$__VCS_SCM%F{red}-%F{magenta}[$__VCS_BRANCH%F{magenta}$__VCS_FORMAT%F{magenta}]%f-[$__VCS_REV]%f" # no %m
__VCS_ACTION_FORMATS="$__VCS_SCM%F{red}-%F{magenta}[$__VCS_BRANCH%F{magenta}$__VCS_FORMAT$__VCS_ACTION%F{magenta}]%f-[$__VCS_REV]%f"

zstyle ':vcs_info:*' formats       "$__VCS_FORMATS"
zstyle ':vcs_info:*' actionformats "$__VCS_ACTION_FORMATS"

zstyle ':vcs_info:p4*:' use-server false

PS1_HIST="%! ";
PS1_USER="%F{blue}%n";
if __inSSH
then
	PS1_HOST="%B%F{blue}%m%b"
else
	PS1_HOST="%F{blue}%m";
fi
PS1_ERR="%F{red}%(?.. !%?!)";    #return code of last command (if it was not 0)
PS1_WD=" %F{magenta}%30<...<%~"; #current working directory limited to 30 chars
PS1_END="%(!.★.∴)"
[ -n "$__EC2_IID" ] && PS1_EC2=" ($__EC2_IID)"

PS1_VIM="%F{green}${VIMRUNTIME:+vim}%f"

setCurrentPS1()
{
  local $(stat -Ls .)
  PS1_N_FILES="[$(( $st_nlink - 1 )) files] "
  PS1_VCS="%F{green}$vcs_info_msg_0_${vcs_info_msg_0_:+ }"
	_VENV_NAME="${VIRTUAL_ENV##*/}"
	_COLOR_VENV_NAME="(%F{blue}${_VENV_NAME}%f) "
	RPS1_PYTHON="${_VENV_NAME:+$_COLOR_VENV_NAME}"
  local _bg_jobs="$(jobs)"
  PS1_BG_JOBS="%f${_bg_jobs:+ ⚙}"
}

PS1='[$PS1_HIST$PS1_USER@$PS1_HOST$PS1_BATTERY$PS1_EC2$PS1_WD$PS1_BG_JOBS$PS1_ERR%f]$PS1_END'
PS2='%F{cyan}%F{blue}(%F{green}%_%F{blue})%F{cyan}%f ';
RPS1='$PS1_N_FILES${VIMRUNTIME:+"{$PS1_VIM}"}${RPS1_PYTHON}$PS1_VCS%f';

setPS1Battery() {
	[ "$uname_s" = "FreeBSD" -a -n "$__shellrc_battery" ] && PS1_BATTERY=" %F{yellow}($(sysctl -n hw.acpi.battery.life)%%)"
}

autoload -Uz  add-zsh-hook
add-zsh-hook precmd vcs_info
add-zsh-hook precmd setCurrentPS1
add-zsh-hook periodic setPS1Battery
