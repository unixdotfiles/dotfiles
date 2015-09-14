alias mv="mv -i";
alias cp="cp -i";

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
__exists vim && alias vim="vim -p";

__exists xterm && alias cterm="xterm -C -T 'Console Eterm'";

__exists idesk && alias switch-background="pkill idesk && idesk &";
__exists youtube-dl && alias youtube-dl="youtube-dl -t";
alias startx="startx -audit 4 -nolisten tcp";
alias sgrep='grep --exclude "*svn*" -I';
__exists portmaster && alias portmaster="portmaster -m'-DNO_DEPENDS'";
__exists urxvt && alias urxvt="urxvtcd"
__exists proxychains && alias pc="proxychains"
alias myip="curl ifconfig.pro";

alias lls="ls -lao";
alias tolower="tr A-Z a-z"
alias toupper="tr a-z A-Z"
alias rot13="tr [A-Za-z] [N-ZA-Mn-za-m]"
__exists pastebinit && alias pastebinit="pastebinit -a ''"
__exists portlint && alias portlint="portlint -C";
alias sprunge='curl -F '\''sprunge=<-'\'' http://sprunge.us'
__exists curl && dict() { curl "dict://dict.org/d:$1"; }
__exists hub && alias git="hub"

alias diff="diff -p";

alias ll="ls -halt"

alias timestamp='date +%s'

#alias cd="pushd";
alias p="pushd";
alias b="popd";

# chmod aliases
alias rwx="chmod 700"
alias rw-="chmod 600"
alias r-x="chmod 755"
alias r--="chmod 644"

__exists cscope && alias cscope="cscope -CqRv";
__exists txt2regex && alias txt2regex="txt2regex --whitebg";
__exists ack-grep && alias ack="ack-grep"
__exists gpg2 && ! __exists gpg && alias gpg=gpg2

__exists kinit && alias kinit="kinit --keychain"

__exists swipl && alias swipl="swipl -q"
__exists R && alias R="R --save --quiet"

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
