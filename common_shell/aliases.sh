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

__exists vim && alias vi="vim -p";
redefine vim="vim -p";

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
