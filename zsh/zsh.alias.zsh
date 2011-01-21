alias -s txt=$EDITOR
alias -s cpp=$EDITOR
#alias -s awk=awk
#alias -s nawk=nawk
# cd to a file should take you to the dir that contains the file
# courtesy of Artur Penttinen <artur@xxxxxxxxxxx>
function cd () {
  if [[ -f $1 ]]; then
    builtin cd $1:h
  else
    builtin cd $1
  fi
}

function pushd () {
	if [[ $# -eq 0 ]]
	then
		builtin cd;
	else
		if [[ -f $1 ]]
		then
			builtin pushd $1:h;
		else
			builtin pushd $1;
		fi
	fi
}

#mkdir should cd as well
function mcd () {
	if [ $# -eq 1 ]
	then
		mkdir $1;
		cd $1;
	else
		mkdir $@;
	fi
}
setopt correct_all

alias man='nocorrect man'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias touch='nocorrect touch'
alias ln='nocorrect ln'
alias mkdir='nocorrect mkdir'

alias cd\?="dirs";
alias back='cd "$OLDPWD";pwd'
h () { history 0 | grep "$1" }