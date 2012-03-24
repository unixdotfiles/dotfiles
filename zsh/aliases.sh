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
elif [ "$uname_s" = "Linux" ]
then
	alias fetch="wget"
fi

__exists vim && alias vi="vim";

alias cEterm="\Eterm -C -T 'Console Eterm' -f'red'";
#alias nvlc="nvlc --volume 1024";
#alias vlc="vlc_create_sock";
alias dcvs="cvs -d eadler@dcvs.freebsd.org/home/dcvs";
alias pcvs="cvs -d eadler@pcvs.freebsd.org/home/pcvs";
alias projcvs="cvs -d eadler@projcvs.freebsd.org/home/projcvs";
alias bcvs="cvs -d anoncvs@anoncvs1.FreeBSD.org:/home/ncvs";
alias fbcvs="cvs -d anoncvs@anoncvs.fr.FreeBSD.org:/home/ncvs";
alias projcvs="cvs -d eadler@projcvs.FreeBSD.org:/home/projcvs";
alias marcus-cvs="cvs -z3 -d:pserver:anonymous@creme-brulee.marcuscom.com:/space/cvs/marcuscom-cvs";

__exists python2 && alias python2="python -tt3";
__exists python3.2 && alias python="python3.2"
alias noflash="pkill -3 -l npviewer.bin";
alias noflash_9="noflash|sed "s/3/9/"|sh -x 2>&1|sed 's/\+ //'";
alias switch-background="pkill idesk && idesk &";
alias youtube-dl="youtube-dl -t";
alias startx="ssh-agent startx -audit 4 -nolisten tcp";
alias sgrep='grep --exclude "*svn*" -I';
alias srcloc="whereis -qs";
__exists portmaster && alias portmaster="portmaster -m'-DNO_DEPENDS'";
alias urxvt="urxvtcd"
#alias su="su -l"
__exists proxychains && alias pc="proxychains";
alias shareThisDir="python -m http.server 8000";
alias lls="ls -lao";
__exists firefox && alias firefox="firefox -no-remote";
__exists firefox3 && alias firefox="firefox3 -no-remote";
alias tolower="tr A-Z a-z"
alias toupper="tr a-z A-Z"
__exists pastebinit && alias pastebinit="pastebinit -a ''";
__exists portlint && alias portlint="portlint -C";

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
	if [ "x$PORTSDIR" = "x" ]
	then
		PORTSDIR="/usr/ports"
	fi
	find "$PORTSDIR" -depth 2 -type d -execdir fgrep -H "$1" {}/Makefile \;
}


__exists idprio && alias verynice="nice nice idprio 31";

__exists calendar && [ -f /usr/share/calendar/calendar.freebsd ] &&
	alias bsdcal="calendar -f /usr/share/calendar/calendar.freebsd";

__exists now && alias now="now '%a, %b %d %Y, %r %Z (%z)'"

# stolen from zi (from cacits@rit.edu)
wiki()  {
	dig +short txt $1.wp.dg.cx;
}
dirsize() {
	du -sk $* | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf ("%6.1f\t%s\t%25s %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}';
}
randpassword() {
	< /dev/urandom tr -dc A-Za-z0-9_ | head -c${1:-16} && printf "\n";

}
