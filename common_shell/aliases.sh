# Enable ls colors
if __exists colorls
then
    alias ls="colorls -GF"
# GNU ls (can't test -G because it means no-group)
elif ls --version >/dev/null 2>&1
then
    ls --color -d . >/dev/null 3>&1 && alias ls='ls -F --color=tty'
else
    ls -G >/dev/null 2>&1 && alias ls='ls -GF'
fi

if [ "$_uname_s" = "FreeBSD" ]
then
  alias rm="rm -I";
  alias free="top -b|grep -E '^(Mem|Swap|ARC)'"
  alias iotop='top -m io -o total'
elif [ "$_uname_s" = "Darwin" ]
then
  redefine kinit="kinit --keychain"
  alias free="top -S|head -12"
  alias localip="ipconfig getifaddr en0"
  alias showcodesign="codesign -dvvv -r - --entitlements - --extract-certificates --file-list - --strict=all --deep"
  __osx_define_alias ios /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
fi

__exists vim && redefine vi="vim"
__exists nvim && redefine vi="nvim"
__exists nvim && redefine vim="nvim"

__exists idesk && alias switch-background="pkill idesk && idesk &";

__exists dig && alias myip="dig +short myip.opendns.com @resolver1.opendns.com";
alias mv="mv -i";
alias cp="cp -i";
alias ll="ls -halt"
alias lls="ls -lao";
alias tolower="tr [:upper:] [:lower:]"
alias toupper="tr [:lower:] [:upper:]"
alias newlines="tr ' ' '\n'"
alias rot13='tr "[A-Za-z]" "[N-ZA-Mn-za-m]"'

alias today="date +%F"
alias now="date +%F-%H-%M-%S"
alias timestamp='date +%s'
utctodate() {
  date -r "$@"
}

__exists curl && dict() { curl "dict://dict.org/d:$1"; }
__exists hub && redefine git="hub"
! __exists hd && __exists hexdump && alias hd="hexdump -C"

redefine diff="diff -p";
redefine grep="grep --color=auto"
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
redefine xz="xz -T0"
redefine grunt="grunt --stack"
redefine gdb="gdb -s"
redefine irb="irb --multiline"
redefine tree="tree -C"

alias ncvs="cvs -d eadler@cvs.NetBSD.org:/cvsroot"
alias nwcvs="cvs -d anoncvs@wiki.NetBSD.org:/cvsroot"
alias ocvs="cvs -d anoncvs@anoncvs.ca.openbsd.org:/cvs"

alias p="pushd";
alias b="popd";

__exists kitten && alias pbcopy="kitten clipboard"

__exists ack-grep && alias ack="ack-grep"
__exists gpg2 && ! __exists gpg && alias gpg=gpg2

if [ "$TERM" = "xterm-kitty" ];then
  alias ssh='kitty +kitten ssh'
fi

redefine python="python -R"
__py3opt="-bbttq"
for wpython in python3 python3.{13..30}
do
    _pythonver="${wpython#python}"
    _pythonmajorver="${_pythonver%%[^0-9]*}"
    if __exists $wpython
    then
      alias python="$wpython $__py3opt"
      alias python${_pythonmajorver}="$wpython $__py3opt"
      alias shareThisDir="$wpython -m http.server 8000"
    fi
    _expected_pip="pip${_pythonver}"
    if __exists "$_expected_pip"
    then
      alias pip="$_expected_pip"
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

dirsize() {
	du -sk "$@" | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf ("%6.1f\t%s\t%25s %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}';
}

randpassword() {
	LC_ALL=C < /dev/urandom tr -dc '[:print:]' | head -c"${1:-16}" && printf "\n";
}

# Create a data URL from a file
dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType = text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

fastlane() {
  bundle exec -- fastlane "$@"
}

if [ /Applications/Tailscale.app/Contents/MacOS/Tailscale ]
then
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi
