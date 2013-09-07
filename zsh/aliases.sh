alias mv="mv -i";
alias cp="cp -i";

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
	# Find the option for using colors in ls, depending on the version: Linux or BSD
	ls --color -d . &>/dev/null 2>&1 && alias ls='ls -F --color=tty' || alias ls='ls -GF'
fi

uname_s=$(uname -s)

if [ "$uname_s" = "FreeBSD" ]
then
	alias rm="rm -I";
	alias less="less -R";
	alias free="top -b|egrep '^(Mem|Swap)'"
	alias iotop='top -m io -o total'
fi
! __exists fetch && __exists wget && alias fetch=wget

__exists vim && alias vi="vim -p";
__exists vim && alias vim="vim -p";

alias cterm="xterm -C -T 'Console Eterm'";

__exists python2 && alias python2="python -tt";
alias noflash="pkill -3 -l npviewer.bin";
alias noflash_9="pkill -9 -l npviewer.bin";
alias switch-background="pkill idesk && idesk &";
alias youtube-dl="youtube-dl -t";
alias startx="ssh-agent startx -audit 4 -nolisten tcp";
alias sgrep='grep --exclude "*svn*" -I';
alias srcloc="whereis -qs";
__exists portmaster && alias portmaster="portmaster -m'-DNO_DEPENDS'";
alias urxvt="urxvtcd"
#alias su="su -l"
__exists python3.2 && ! __exists python3 && alias python3=python3.2
__exists proxychains && alias pc="proxychains";
alias shareThisDir="python3 -m http.server 8000";
alias lls="ls -lao";
__exists firefox && alias firefox="firefox -no-remote";
alias tolower="tr A-Z a-z"
alias toupper="tr a-z A-Z"
__exists pastebinit && alias pastebinit="pastebinit -a ''";
__exists portlint && alias portlint="portlint -C";
alias sprunge='curl -F '\''sprunge=<-'\'' http://sprunge.us'

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

__exists calendar && [ -f /usr/share/calendar/calendar.freebsd ] &&
	alias bsdcal="calendar -f /usr/share/calendar/calendar.freebsd";

dirsize() {
	du -sk $* | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf ("%6.1f\t%s\t%25s %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}';
}
randpassword() {
	LANG=C < /dev/urandom tr -dc A-Za-z0-9_ | head -c${1:-16} && printf "\n";

}

__exists cscope && alias cscope="cscope -CqRv";

__exists hub && alias git="hub";

ssh-add-maybe() {
	ssh-add -l >/dev/null 2>&1 || ssh-add
	return 0;
}

ssh() {
	ssh-add-maybe && command ssh "$@"
}
