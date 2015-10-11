# Enable ls colors
if [ -z "$DISABLE_LS_COLORS" ]
then
    if __exists colorls
    then
        alias ls="colorls -GF"
    else
        # Find the option for using colors in ls, depending on the version: Linux or BSD
        ls --color -d . &>/dev/null 2>&1 && alias ls='ls -F --color=tty' || alias ls='ls -GF'
    fi
fi

if [ "$uname_s" = "FreeBSD" ]
then
	alias rm="rm -I";
	alias less="less -R";
	alias free="top -b|egrep '^(Mem|Swap|ARC)'"
	alias iotop='top -m io -o total'
fi
! __exists fetch && __exists wget && alias fetch=wget

__exists vim && redefine vi="vim"

__exists idesk && alias switch-background="pkill idesk && idesk &";

alias sgrep='grep --exclude "*svn*" -I';

alias myip="curl ifconfig.pro";

alias mv="mv -i";
alias cp="cp -i";
alias ll="ls -halt"
alias lls="ls -lao";
alias tolower="tr A-Z a-z"
alias toupper="tr a-z A-Z"
alias rot13="tr [A-Za-z] [N-ZA-Mn-za-m]"
alias sprunge='curl -F '\''sprunge=<-'\'' http://sprunge.us'
__exists curl && dict() { curl "dict://dict.org/d:$1"; }
__exists hub && redefine git="hub"

redefine diff="diff -p";
redefine pastebinit="pastebinit -a ''"
redefine portlint="portlint -C";
redefine youtube-dl="youtube-dl -t";
redefine startx="startx -audit 4 -nolisten tcp";
redefine portmaster="portmaster -m'-DNO_DEPENDS'";
redefine urxvt="urxvtcd"
redefine cscope="cscope -CqRv";
redefine txt2regex="txt2regex --whitebg";
redefine kinit="kinit --keychain"
redefine swipl="swipl -q"
redefine R="R --save --quiet"

alias timestamp='date +%s'

alias p="pushd";
alias b="popd";

# chmod aliases
alias rwx="chmod 700"
alias rw-="chmod 600"
alias r-x="chmod 755"
alias r--="chmod 644"

__exists ack-grep && alias ack="ack-grep"
__exists gpg2 && ! __exists gpg && alias gpg=gpg2
__osx_define_alias ios /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
prefixwith "grc -es --colour=auto" diff make gcc g++ as gas clang clang++ ld netcat nc ping traceroute df mtr ps mount dig tail head

for wpython in python2 python2.7 python3 python3.3 python3.5 python3.4
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

function mcd () {
	if [ $# -eq 1 ]
	then
		mkdir "$1";
		cd "$1";
	else
		mkdir "$@";
	fi
}

text_textbelt() {
    number="$1"
    message="$2"
    curl http://textbelt.com/text -d number="$1" -d message="'$2'"
}

dirsize() {
	du -sk $* | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf ("%6.1f\t%s\t%25s %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}';
}

randpassword() {
	LANG=C < /dev/urandom tr -dc '[:print:]' | head -c${1:-16} && printf "\n";
}
