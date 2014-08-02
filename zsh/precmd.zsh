checkAndSetWindowTitle() {
	local program_name="$1";
	program_name=$(convertAliasToFull "$program_name");

	# Set the window name to the currently running program.
	if  ! isShortName "$program_name" 
	then
		setWindowTitle $(getTitleFromProgram "$program_name");
		window_reset="yes"
	fi
}

getTitleFromProgram() {
	local program_name="$@";
	local runningAsRoot="";

	if [[ $program_name = ${program_name#sudo} ]] # || $program_name=${program_name#su} ]];
	then
		runningAsRoot=yes
	fi

    if __isroot
    then
		runningAsRoot=yes
    fi

	if [ -n $runningAsRoot ]; then
		program_name="!$program_name"
	fi

	# Add an at mark at the beginning if running through ssh on a
	# different computer.
	if __inSSH;  then
		program_name="@$program_name"
		# If tmux is running in SSH then display "@:hostname" as title
		# in the term/outer screen.
		if [[ $program_name == "@tmux" ]]; then
			program_name="@:${HOST//.*/}"
		# Use "@:!hostname" for root screens.
		elif [[ $program_name == "@!tmux" ]]; then
			program_name="@:!${HOST//.*/}"
		fi
	fi
	echo $program_name;
}

# Change my shortcuts so the real name of the program is displayed.
convertAliasToFull() {
	local text="$1"
#	case $text in
#	   sgrep)
#			text=grep
#			;;
#	esac

	echo "$text";
}

# Ignore often used commands which are only running for a very short
# time. This prevents a "blinking" look.
isShortName() {
	[[ "$1" == (cd*|b|ls|la|ll|lls) ]] && return 0 ;
	return 1;
}

# Create function per terminal. Don't check inside function for performance reasons
case "$TERM" in
	screen*) # and tmux
		setWindowTitle() {
		    print -n "\ek${(V)1}\e\\";
		};;
	xterm*)
		setWindowTitle() {
		    print -n "\e]2;${(V)1}\e\\";
		};;
	*rxvt*)
		setWindowTitle() {
		    print -n "\e]2;${(V)1}\e\\";
		};;
	Eterm*)
		setWindowTitle() {
			print -Pn "\e]2;$value\a\e[1;\a";
		};;
	*)
		setWindowTitle() {
		};;
esac	


function resetWindowTitle() {
	# Abort if no window name reset is necessary.
	[[ -z $window_reset ]] && return

	local name="zsh - $CWD";
	setWindowTitle "$name";

	# Just reset the name, so no screen reset necessary for the moment.
	window_reset="";
}

#function changeTitlePreExec() {
#  # The full command line comes in as "$1"
#  local cmd="$1"
#  local -a args
#
#  args=${(z)tmpcmd}
#
#  if [ "${args[1]}" = "fg" ] ; then
#    local jobnum="${args[2]}"
#    if [ -z "$jobnum" ] ; then
#      # If no jobnum specified, find the current job.
#      for i in ${(k)jobtexts}; do
#        [ -z "${jobstates[$i]%%*:+:*}" ] && jobnum=$i
#      done
#    fi
#    cmd="${jobtexts[${jobnum#%}]}"
#  else
#  fi
#  title "$cmd"
#}
#function title() {
#  # This is madness.
#  # We replace literal '%' with '%%'
#  # Also use ${(V) ...} to make nonvisible chars printable (think cat -v)
#  # Replace newlines with '; '
#  local value="${${${(V)1//\%/\%\%}//'\n'/; }//'\t'/ }"
#  local location
#
#  location="$HOST"
#
#  # Special format for use with print -Pn
#  value="%70>...>$value%<<"
#  unset PROMPT_SUBST
#  setopt LOCAL_OPTIONS
#}

# If ^C is pressed while typing a command, add it to the history so it can be
# easily retrieved later and then abort like ^C normally does. This is useful
# when I want to abort an command to do something in between and then finish
# typing the command.

TRAPINT() {
    # Store the current buffer in the history.
    zle && print -s -r -- $BUFFER

    # Return the default exit code so Zsh aborts the current command.
    return $1
}
autoload -Uz  add-zsh-hook
add-zsh-hook precmd setCurrentPS1
add-zsh-hook preexec setExecutionTimer
add-zsh-hook preexec checkAndSetWindowTitle
add-zsh-hook precmd resetWindowTitle
#add-zsh-hook preexec changeTitlePreExec
