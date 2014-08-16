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

uname_s=$(uname -s)

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

__exists python2 && alias python2="python2 -tt";
__exists ipython && alias ipython="ipython --no-confirm-exit";
__exists idesk && alias switch-background="pkill idesk && idesk &";
__exists youtube-dl && alias youtube-dl="youtube-dl -t";
alias startx="startx -audit 4 -nolisten tcp";
alias sgrep='grep --exclude "*svn*" -I';
__exists portmaster && alias portmaster="portmaster -m'-DNO_DEPENDS'";
__exists urxvt && alias urxvt="urxvtcd"
__exists python3.2 && ! __exists python3 && alias python3=python3.2
__exists proxychains && alias pc="proxychains"
__exists python && alias shareThisDir="python -m http.server 8000"
__exists python2 && alias shareThisDir="python2 -m SimpleHTTPServer"
__exists python3 && alias shareThisDir="python3 -m http.server 8000"
alias lls="ls -lao";
alias tolower="tr A-Z a-z"
alias toupper="tr a-z A-Z"
__exists pastebinit && alias pastebinit="pastebinit -a ''"
__exists portlint && alias portlint="portlint -C";
alias sprunge='curl -F '\''sprunge=<-'\'' http://sprunge.us'
alias ssh="__ensure_sshagent && ssh"
__exists hg && alias hg="__ensure_sshagent && hg"
__exists git && alias git="__ensure_sshagent && git"
__exists hub && alias git="__ensure_sshagent && hub"
__exists svn && alias svn="__ensure_sshagent && svn"
alias scp="__ensure_sshagent && scp"

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

portsGrep() {
	local PORTSDIR
	PORTSDIR=${PORTSDIR:-/usr/ports}
	find "$PORTSDIR" -depth 2 -type d -execdir fgrep -H "$1" {}/Makefile \;
}

__exists idprio && alias verynice="nice nice idprio 31";
__exists cscope && alias cscope="cscope -CqRv";
__exists txt2regex && alias txt2regex="txt2regex --whitebg";
__exists ack-grep && alias ack="ack-grep"

dirsize() {
	du -sk $* | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf ("%6.1f\t%s\t%25s %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}';
}
randpassword() {
	LANG=C < /dev/urandom tr -dc A-Za-z0-9_ | head -c${1:-16} && printf "\n";

}

explain_type() {
    local type="$1"

    if [ -z "${type}" ]; then
        echo "No type given, dude"
        return 1
    fi

    dtrace -qn 'BEGIN {p=('"${type}"'*)alloca(sizeof('"${type}"')); print(*p);exit(0)}'
}
