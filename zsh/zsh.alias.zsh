alias -s txt=$EDITOR
alias -s cpp=$EDITOR
#alias -s awk=awk
#alias -s nawk=nawk
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
	if [[ $# -eq 0 ]]
	then
		builtin pushd;
	else
		if [[ -f $1 ]]
		then
			builtin pushd $1:h;
		else
			builtin pushd $1;
		fi
	fi
}

function concat() {
	echo -n ${(j::)@}
}

#mkdir should cd as well
function mcd () {
	if [ $# -eq 1 ]
	then
		mkdir "$1";
		cd "$1";
	else
		mkdir "$@";
	fi
}

## Glob functions

#usage, *(e:in /other/dir:)
function in() {
	test -e $1/$REPLY
}

#usage, *(e:hastype mp3:)
function hastype() {
	local a; a=( $REPLY/*.$1([1]N) ); [[ -n $a ]]
}

# *(@-) also works
function brokensym() {
	[[ -L $REPLY && ! -e $(zstat +link $REPLY) ]]
}


alias man='nocorrect man'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias touch='nocorrect touch'
alias ln='nocorrect ln'
alias mkdir='nocorrect mkdir'

alias -g N="&>/dev/null"
alias -g N1="1>/dev/null"
alias -g N2="2>/dev/null"
alias -g DN=">/dev/null"
alias -g G='| grep'
alias -g L='| less'
alias -g S='| sort'
alias -g U='| uniq'
alias -g H='| head'
alias -g T='| tail'
alias -g W='| wc'

alias cd\?="dirs -pv";
alias back='builtin cd "$OLDPWD";pwd'
h () { history 0 | grep "$1" }

autodisown() {
	"$@" &
	disown
}

__exists xpdf && alias xpdf="autodisown xpdf";
__exists evince && alias evince="autodisown evince";

if __exists hub
then
	if type compdef >/dev/null; then
		compdef hub=git
	fi
fi
