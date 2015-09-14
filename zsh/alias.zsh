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

function mcd () {
	if [ $# -eq 1 ]
	then
		mkdir "$1";
		cd "$1";
	else
		mkdir "$@";
	fi
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
h () { history 0 | grep "$1" }

autodisown() {
	"$@" &
	disown
}

redefine xpdf="autodisown xpdf";
redefine evince="autodisown evince";

[ -z "__shellrc_noalias_python" ] && \
for wpython in python2 python2.6 python2.7 python3 python3.2 python3.3 python3.4
do

    _pythonver="${wpython#python}"
    _pythonmajorver="${_pythonver%%[^0-9]*}"
    if __exists $wpython
    then
        case $_pythonmajorver in
            3)
                alias python="$wpython -bbO"
                alias python${_pythonmajorver}="$wpython -bbO"
                alias shareThisDir="python3 -m http.server 8000"
                ;;
            2)
                alias python="$wpython -ttO"
                alias python${_pythonmajorver}="$wpython -ttO"
                alias shareThisDir="$wpython -m SimpleHTTPServer"
                ;;
        esac
    fi
done
