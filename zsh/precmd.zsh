checkAndSetWindowTitle() {
	local program_name="$1";

	# Set the window name to the currently running program.
	if  ! isShortName "$program_name" 
	then
		setWindowTitle $(getTitleFromProgram "$program_name");
		window_reset="yes"
	fi
}

getTitleFromProgram() {
	local program_name="$@";

	if [ "$program_name" = "${program_name#sudo}" ] || [ __isroot ]; then
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

function ensureAuthForCmd() {
  fullcmd="$1"
  cmd="${fullcmd%% *}"  # Doesn't properly handle quotes commandsS
  [[ "$cmd" == (git|hub|svn|hg|curl|ssh|scp) ]] && ensure_auth

  return 0
}

# If ^C is pressed while typing a command, add it to the history so it can be
# easily retrieved later and then abort like ^C normally does.

TRAPINT() {
    # Store the current buffer in the history.
    zle && print -s -r -- $BUFFER

    # Return the default exit code so zsh aborts the current command.
    return $1
}
autoload -Uz  add-zsh-hook
add-zsh-hook preexec checkAndSetWindowTitle
add-zsh-hook preexec ensureAuthForCmd
add-zsh-hook precmd resetWindowTitle
#add-zsh-hook preexec changeTitlePreExec
