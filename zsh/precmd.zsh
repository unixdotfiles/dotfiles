autoload -Uz  add-zsh-hook
add-zsh-hook precmd setCurrentPS1
add-zsh-hook precmd changeTitlePreCmd
add-zsh-hook preexec changeTitlePreExec

function changeTitlePreCmd() {
	title "zsh - $CWD";
}

function changeTitlePreExec() {
  # The full command line comes in as "$1"
  local cmd="$1"
  local -a args

  args=${(z)tmpcmd}

  if [ "${args[1]}" = "fg" ] ; then
    local jobnum="${args[2]}"
    if [ -z "$jobnum" ] ; then
      # If no jobnum specified, find the current job.
      for i in ${(k)jobtexts}; do
        [ -z "${jobstates[$i]%%*:+:*}" ] && jobnum=$i
      done
    fi
    cmd="${jobtexts[${jobnum#%}]}"
  else
  fi
  title "$cmd"
}
function title() {
  # This is madness.
  # We replace literal '%' with '%%'
  # Also use ${(V) ...} to make nonvisible chars printable (think cat -v)
  # Replace newlines with '; '
  local value="${${${(V)1//\%/\%\%}//'\n'/; }//'\t'/ }"
  local location

  location="$HOST"

  # Special format for use with print -Pn
  value="%70>...>$value%<<"
  unset PROMPT_SUBST
  case $TERM in
    screen)
      # Put this in your .screenrc:
      # hardstatus string "[%n] %h - %t"
      # termcapinfo xterm 'hs:ts=\E]2;:fs=\007:ds=\E]2;screen (no title yet)\007'
      print -Pn "\ek${value}\e\\"     # screen title (in windowlist)
      print -Pn "\e_${location}\e\\"  # screen location
#	local CMD=${1[(wr)^(*=*|sudo|-*)]}
#	echo -ne "\ek$CMD\e\\"
      ;;
    xterm*)
      print -Pn "\e]0;$value\a"
      ;;
    Eterm*)
		print -Pn "\e]2;$value\a\e[1;\a";;
  esac
  setopt LOCAL_OPTIONS
}
