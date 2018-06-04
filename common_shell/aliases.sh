# Enable ls colors
if __exists colorls
then
    alias ls="colorls -GF"
else
    # Find the option for using colors in ls, depending on the version: Linux or BSD
    ls --color -d . >/dev/null 2>&1 && alias ls='ls -F --color=tty'
    ls -G >/dev/null 2>&1 && alias ls='ls -GF'
fi

if [ "$_uname_s" = "FreeBSD" ]
then
  redefine less="less -RM"
  alias rm="rm -I";
  alias free="top -b|grep -E '^(Mem|Swap|ARC)'"
  alias iotop='top -m io -o total'
elif [ "$_uname_s" = "Darwin" ]
then
  redefine less="less -RM"
  redefine kinit="kinit --keychain"
  alias free="top -S|head -12"
  alias localip="ipconfig getifaddr en0"
  alias showcodesign="codesign -dvvv -r - --entitlements - --extract-certificates --file-list - --strict=all --deep"
  __osx_define_alias ios /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
fi

__exists vim && redefine vi="vim"

__exists idesk && alias switch-background="pkill idesk && idesk &";

__exists dig && alias myip="dig +short myip.opendns.com @resolver1.opendns.com";
alias mv="mv -i";
alias cp="cp -i";
alias ll="ls -halt"
alias lls="ls -lao";
alias tolower="tr [:upper:] [:lower:]"
alias toupper="tr [:lower:] [:upper:]"
alias rot13='tr "[A-Za-z]" "[N-ZA-Mn-za-m]"'
alias today="date +%F"
alias now="date +%F-%H-%M-%S"
alias timestamp='date +%s'
__exists curl && dict() { curl "dict://dict.org/d:$1"; }
__exists hub && redefine git="hub"
__exists pip-2.7 && alias pip2=pip-2.7
__exists pip-3.6 && alias pip3=pip-3.6
! __exists hd && __exists hexdump && alias hd="hexdump -C"

redefine diff="diff -p";
redefine grep="grep --color=auto"
__exists grc && redefine diff="grc diff -p"
redefine pastebinit="pastebinit -a ''"
redefine portlint="portlint -C";
redefine startx="startx -audit 4 -nolisten tcp";
redefine urxvt="urxvtcd"
redefine cscope="cscope -CqRv";
redefine txt2regex="txt2regex --whitebg";
redefine swipl="swipl -q"
redefine R="R --save --quiet"
redefine cython="cython -Werror -Wextra -p --gdb"
redefine ipython="LESS='-r' ipython"
redefine gist="gist -p"
redefine ag="ag --path-to-ignore ~/.conf/ag/agignore"
redefine rg="rg -S"
redefine xz="xz -T0"
redefine grunt="grunt --stack"
redefine gdb="gdb -s"

alias ncvs="cvs -d eadler@cvs.NetBSD.org:/cvsroot"
alias nwcvs="cvs -d anoncvs@wiki.NetBSD.org:/cvsroot"
alias ocvs="cvs -d anoncvs@anoncvs.ca.openbsd.org:/cvs"

alias p="pushd";
alias b="popd";

__exists ack-grep && alias ack="ack-grep"
__exists gpg2 && ! __exists gpg && alias gpg=gpg2
prefixwith "grc -es --colour=auto" wdiff make gmake gcc g++ as gas clang clang++ ld netcat nc ping ping6 traceroute traceroute6 df ps mount dig drill tail head cvs ifconfig last netstat

redefine python="python -R"
__py3opt="-bbttq"
__py2opt="-3ttRq"
__python_exists=""
__exists python && __python_exists="true"
for wpython in python2 python2.7 python3 python3.6
do
    _pythonver="${wpython#python}"
    _pythonmajorver="${_pythonver%%[^0-9]*}"
    if __exists $wpython
    then
        case $_pythonmajorver in
            3)
                [ -z "$__python_exists" ] && alias python="$wpython $__py3opt"
                alias python${_pythonmajorver}="$wpython $__py3opt"
                alias shareThisDir="$wpython -m http.server 8000"
                ;;
            2)
                [ -z "$__python_exists" ] && alias python="$wpython $__py2opt"
                alias python${_pythonmajorver}="$wpython $__py2opt"
                alias shareThisDir="$wpython -m SimpleHTTPServer"
                ;;
        esac
    fi
done

sum() {
  awk '{s+=$1} END {print s}'
}

mcd() {
  for last; do :; done
  mkdir "$@"
  cd "$last"
}

text_textbelt() {
    curl http://textbelt.com/text -d number="$1" -d message="'$2'"
}

dirsize() {
	du -sk $* | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf ("%6.1f\t%s\t%25s %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}';
}

randpassword() {
	LANG=C < /dev/urandom tr -dc '[:print:]' | head -c"${1:-16}" && printf "\n";
}

# Create a data URL from a file
dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType = text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}
