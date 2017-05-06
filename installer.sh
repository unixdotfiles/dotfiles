#! /bin/sh
self=~/.conf;

begon="$self/.begon";
boxname=$(hostname -s)
osname=$(uname -s)

# shellcheck source=common_shell/functions.sh
. $self/common_shell/functions.sh

_tln () {
	[ ! -e "$1" ] && return 1;

	[ -L "$2" ] || [ -e "$2" ] || (ln -s "$1" "$2" && echo begon "$2" >> "$begon")

	if [ ! -L "$2" ]; then
		if cmp -s "$1" "$2"; then
			echo "warning: $2 matches $1 but is not symlink";
		else
			echo "warning: $2 does not match $1"
		fi
		return 1
	fi
	return 0
}

htln () {
	attempts="$self/$1.local.$boxname $self/$1.os.$osname $self/$1"
	for f in $attempts
	do
		_tln "$f" "$HOME/$2" && break
	done
}

ensure_directories() {
	mkdir -p "$@"
}

ensure_directories ~/.zsh/cache
htln zsh/zshrc .zshrc
htln zsh/zshenv .zshenv
htln sh/profile .profile
htln nano/USE_RC .nanorc
htln nano .mynano
htln atom/ .atom
htln swipl/swipl .swipl
htln X/XCompose .XCompose
htln X/xinitrc .xinitrc
htln X/Xmodmap .Xmodmap
htln X/Xdefaults .Xdefaults
htln X/xserverrc .xserverrc
htln X/xbindkeysrc .xbindkeysrc
#htln X/xsession .xsession
htln mercurial/hgrc .hgrc
htln idesk/ideskrc .ideskrc
htln idesk/idesktop .idesktop
ensure_directories ~/.mplayer ~/.grc
htln mplayer/config .mplayer/config
htln mplayer/mencoder.conf .mplayer/mencoder.conf
htln grc/grc.conf .grc/grc.conf
htln cvs/cvsrc .cvsrc
htln xpdf/xpdfrc .xpdfrc
htln screen/screenrc .screenrc
htln vim/home .vim
htln gdb/gdbinit .gdbinit
htln lldb/lldbinit .lldbinit
ensure_directories ~/.config/openbox ~/.config/pianobar ~/.config/libfm ~/.config/youtube-dl ~/.config/karabiner ~/.config/http-prompt
htln http-prompt/config.py .config/http-prompt/config.py
htln karabiner/karabiner.json .config/karabiner/karabiner.json
htln pianobar/config .config/pianobar/config
htln youtube-dl/config .config/youtube-dl/config
ensure_directories ~/.ptpython
htln ptpython/config.py .ptpython/config.py
htln openbox/menu.xml .config/openbox/menu.xml
htln openbox/rc.xml .config/openbox/rc.xml
ensure_directories ~/.i3
htln i3/config .i3/config
htln i3/i3status.conf .i3status.conf
htln libfm/libfm.conf .config/libfm/libfm.conf
__exists git && git/install.sh	
__exists xdg-mime && xdg/install.sh
htln bash/bashrc .bashrc
htln bash/bash_profile.bash .bash_profile
htln tmux/tmux.conf .tmux.conf
htln readline/inputrc .inputrc
ensure_directories ~/.subversion
htln subversion/config .subversion/config
htln mutt/muttrc .muttrc
htln mail/mailrc .mailrc
htln npm/npmrc .npmrc
ensure_directories ~/.xchat2
htln xchat/xchat.conf .xchat2/xchat.conf
ensure_directories ~/.gnupg
htln gpg/gpg.conf .gnupg/gpg.conf
htln gtk/gtk-bookmarks .gtk-bookmarks
htln ack/ackrc .ackrc
htln slate/slate .slate
htln pants/pants.rc .pants.rc
htln psql/psqlrc .psqlrc
htln irb/irbrc .irbrc
ensure_directories ~/.R
htln R/Rprofile .Rprofile
ensure_directories ~/.ipython/profile_default
htln ipython/ipython_config.py .ipython/profile_default/ipython_config.py
htln sqlite/sqliterc .sqliterc
htln mysql/my.cnf .my.cnf
htln pdb/pdbrc .pdbrc
ensure_directories ~/.virtualenvs
htln ipython/postactivate .virtualenvs/postactivate
htln ipython/postdeactivate .virtualenvs/postdeactivate
ensure_directories ~/.gradle ~/.ammonite
htln gradle/gradle.properties .gradle/gradle.properties
htln ammonite/predef.sc .ammonite/prefdef.sc
ensure_directories ~/.stack/global-project
htln stack/stack.yaml .stack/global-project/stack.yaml 
htln stack/config.yaml .stack/config.yaml 
htln gem/gemrc .gemrc
htln mdl/mdlrc .mdlrc
ensure_directories ~/.ssh ~/.ssh/s
[ ! -f ~/.ssh/config ] && cp -p $self/ssh/ssh_config.template ~/.ssh/config
ensure_directories ~/.parallel
touch ~/.mail_aliases ~/.parallel/will-cite
if [ "$osname" = "Darwin" ]
then
  _app_support="$HOME/Library/Application Support"
  mkdir -p "$_app_support/pip"
  if [ ! -e "$_app_support/pip/pip.conf" ]
  then
    ln -s "$self/pip/pip.conf" "$_app_support/pip/pip.conf"
  fi
fi
# add password to config/pianobar/passwd
# import gpg from dbx
