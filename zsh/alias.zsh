# cd to a file should take you to the dir that contains the file
# courtesy of Artur Penttinen <artur@xxxxxxxxxxx>

function cd () {
  local opt
  # eat options from the beginning
  while case $1 in
    -[qLPs]#|--)
      opt=($opt $1)
      shift
    ;|
    --)
    ;&
    ^(-[qLPs]#))
      false
    ;;
  esac; do :; done
  # eat options from the end, if -- wasn't given
  if [[ $opt[(I)--] == 0 ]]; then; while case $@[#] in
  -[qLPs]#)
    opt=($opt $@[#])
    set -- $@[1,#-1]
  ;;
  *)
    false
  ;;
  esac; do :; done; fi
  if [[ $# = 0 ]]
  then
    builtin cd $opt;
  else
    if [[ ${+2} = 0 ]]; then
      if [[ -f "$1" ]]; then
        builtin cd $opt "$1:h"
      else
        builtin cd $opt "$1"
      fi
    else
      if [[ -z "$3" ]]; then
        builtin cd $opt "$1" "$2"
      else
        echo >&2 cd: too many arguments
      fi
    fi
  fi
}

function pushd () {
  if [ $# -eq 0 ]
  then
    builtin pushd;
  else
    if [ -f "$1" ]
    then
      builtin pushd "${1:h}";
    else
      builtin pushd "$1";
    fi
  fi
}

function concat() {
  printf '%s' ${(j::)@}
}

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias touch='nocorrect touch'
alias ln='nocorrect ln'
alias mkdir='nocorrect mkdir'

alias -g N="&>/dev/null"
alias -g N1="1>/dev/null"
alias -g N2="2>/dev/null"
alias -g DN=">/dev/null"
alias -g C='| cat'
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sort'
alias -g U='| uniq'
alias -g T='| tail'
alias -g W='| wc'

autoload -U zmv
autoload -U zargs

alias zcp="zmv -C"
alias zln="zmv -L"

alias vcsi="vcs_info command; vcs_info_lastmsg"

alias cd\?="dirs -pv";
h () { history 0 | grep "$@" }

autodisown() {
  "$@" &
  disown
}

redefine xpdf="autodisown xpdf";
redefine evince="autodisown evince";

autoload -U colors && colors
man() {
	LESS_TERMCAP_md="$fg[blue]" \
	LESS_TERMCAP_me="$reset_color" \
	LESS_TERMCAP_se="$reset_color" \
	LESS_TERMCAP_so="$bg[blue]$fg_bold[yellow]" \
	LESS_TERMCAP_ue="$reset_color" \
	LESS_TERMCAP_us="$fg[magenta]" \
	nocorrect command man "$@"
}
