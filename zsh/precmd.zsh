autoload -Uz  add-zsh-hook
#add-zsh-hook precmd setCurrentPS1
add-zsh-hook precmd resetWindowTitle
#add-zsh-hook preexec changeTitlePreExec
    # Add the preexec() and precmd() hooks.
    add-zsh-hook preexec window_preexec
    add-zsh-hook precmd window_precmd
if [[ $TERM == screen* || $TERM == xterm* || $TERM == rxvt* ]]; then
    # Is set to a non empty value to reset the window name in the next
    # precmd() call.
    window_reset=yes
    # Is set to a non empty value when the shell is running as root.
    if [[ $UID -eq 0 ]]; then
        window_root=yes
    fi

    window_preexec() {
        # Get the program name with its arguments.
        local program_name=$1

        # When sudo is used use real program name instead, but with an
        # exclamation mark at the beginning (handled below).
        local program_sudo=
        if [[ $program_name == sudo* ]]; then
            program_name=${program_name#sudo }
            program_sudo=yes
        fi
        # Remove all arguments from the program name.
        program_name=${program_name%% *}

        # Ignore often used commands which are only running for a very short
        # time. This prevents a "blinking" name when it's changed to "cd" for
        # example and then some milliseconds later back to "zsh".
        [[ $program_name == (cd*|b|ls|la|ll) ]] && return

        # Change my shortcuts so the real name of the program is displayed.
#        case $program_name in
#            alias)
#                program_name=realname
#                ;;
#        esac
#
        # Add an exclamation mark at the beginning if running with sudo or if
        # running zsh as root.
        if [[ -n $program_sudo || -n $window_root ]]; then
            program_name="!$program_name"
        fi

        # Add an at mark at the beginning if running through ssh on a
        # different computer.
        if __inSSH  then
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

        # Set the window name to the currently running program.
        setWindowTitle "$program_name"

        # Tell precmd() to reset the window name when the program stops.
        window_reset=yes
    }

else
    # Fallback if another TERM is used, necessary to run screen (see below in
    # "RUN COMMANDS").
    window_preexec() { }
fi

case "$TERM" in
	screen*) # and tmux
		setWindowTitle() {
            print -n "\ek${(V)1}\e\\";
		};;
	xterm*)
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
window_r
if [[ $UID -eq 0 ]]; then
	window_root=yes
fi

function resetWindowTitle() {
	title "zsh - $CWD";
	# Abort if no window name reset is necessary.
	[[ -z $window_reset ]] && return

	local name="zsh - $CWD"

	# Prepend prefixes like in window_preexec().
	if [[ -n $window_root ]]; then
		name="!$name"
	fi

	if __inSSH then
		name="@$name"
	fi
	setWindowTitle $name

	# Just reset the name, so no screen reset necessary for the moment.
	window_reset=
    }
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
