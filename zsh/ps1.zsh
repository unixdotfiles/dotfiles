autoload -Uz vcs_info
zstyle ':vcs_info:*:' use-simple false
zstyle ':vcs_info:*' enable git svn hg cvs
# [ formats ]
#zstyle ':vcs_info:*' disable cdv darcs mtn svk tla git-p4 bzr p4
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-mq true
zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' hgrevformat "%r:%h"
zstyle ':vcs_info:hg*:*' branchformat "%b" # no %r
zstyle ':vcs_info:hg*:*' patchformat "%p%u%n%c%a%g%G"
zstyle ':vcs_info:hg*:*' nopatchformat "%p%u%n%c%a%g%G"

# disable check-for-changes (%c+%u/staged+unstaged style) since it costs ~ 30ms
zstyle ':vcs_info:*' check-for-changes false # 30ms cost
zstyle ':vcs_info:*' check-for-staged-changes false # 25ms cost
zstyle ':vcs_info:*' stagedstr "%F{red}●%f"
# zstyle ':vcs_info:*' unstagedstr "%F{green}●%f"

__VCS_SCM="%F{magenta}(%f%s:%r%F{magenta})"
__VCS_BRANCH="%F{green}%b%u%c%f"
#__VCS_REV="[-%i]"
__VCS_REV=""
__VCS_ACTION="%F{3}|%F{1}%a:%m"
__VCS_FORMATS="$__VCS_SCM%F{red}-%F{magenta}[$__VCS_BRANCH%F{magenta}$__VCS_FORMAT%F{magenta}]%f$__VCS_REV%f"
__VCS_ACTION_FORMATS="$__VCS_SCM%F{red}-%F{magenta}[$__VCS_BRANCH%F{magenta}$__VCS_FORMAT$__VCS_ACTION%F{magenta}]%f-[$__VCS_REV]%f"

zstyle ':vcs_info:*' formats       "$__VCS_FORMATS"
zstyle ':vcs_info:*' actionformats "$__VCS_ACTION_FORMATS"

zstyle ':vcs_info:p4*:' use-server false

PS1_HIST="%! ";
PS1_TIME="%F{3}%D{%H:%M:%S.%.} "
PS1_USER="%F{blue}%n";
if __inSSH
then
	PS1_HOST="@%B%F{blue}%m%b"
else
	PS1_HOST="@%F{blue}%m";
fi
PS1_ERR="%F{red}%(?.. !%?!)";    #return code of last command (if it was not 0)
PS1_WD=" %F{magenta}%30<...<%~"; #current working directory limited to 30 chars
PS1_JOBS="%F{green}%(1j.⚙  %j.)"
PS1_SHLVL="%F{grey}%(2L.🐚 %L.)"
PS1_END="%(!.☭.∴)"
[ -n "$__EC2_IID" ] && PS1_EC2=" ($__EC2_IID)"

PS1_VIM="%F{green}${VIMRUNTIME:+vim}%f"

setCurrentPS1()
{
  #local $(stat -Ls .)
  PS1_VCS="%F{green}$vcs_info_msg_0_${vcs_info_msg_0_:+ }"
	_PYTHON_ENV_NAME="${VIRTUAL_ENV##*/}"
  if [[ -n "$CONDA_DEFAULT_ENV" ]]
  then
    _PYTHON_ENV_NAME="$CONDA_DEFAULT_ENV"
  fi
	_COLOR_PYTHON_ENV_NAME="(%F{blue}${_PYTHON_ENV_NAME}%f) "
	RPS1_PYTHON="${_PYTHON_ENV_NAME:+$_COLOR_PYTHON_ENV_NAME}"
}

PS1='[$PS1_HIST$PS1_TIME${PS1_USER}${PS1_HOST}$PS1_BATTERY$PS1_EC2$PS1_WD$PS1_SHLVL$PS1_JOBS$PS1_ERR%f]$PS1_END'
PS2='%F{cyan}%F{blue}(%F{green}%_%F{blue})%F{cyan}%f ';
RPS1='${VIMRUNTIME:+"{$PS1_VIM}"}${RPS1_PYTHON}$PS1_VCS%f';

setPS1Battery() {
	[ "$_uname_s" = "FreeBSD" -a -n "$__shellrc_battery" ] && PS1_BATTERY=" %F{yellow}($(sysctl -n hw.acpi.battery.life)%%)"
}

autoload -Uz  add-zsh-hook

# sometimes git can be very slow so it shouldn't run every command
# but we don't want this on all machines
if [[ -n "${__shellrc_limit_vcs_info}" ]]
then
  add-zsh-hook chpwd vcs_info
else
  add-zsh-hook precmd vcs_info
fi

# add-zsh-hook periodic vcs_info
add-zsh-hook precmd setCurrentPS1
add-zsh-hook periodic setPS1Battery

# Set up lazily loaded profiler function
zsh-prompt-benchmark() {
  source ~/.conf/zsh/funcs/zsh-prompt-benchmark.plugin.zsh
  zsh-prompt-benchmark "$@"
}
