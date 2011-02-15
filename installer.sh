#! /bin/sh -x
self=$(realpath ~/.conf);
begon="$self/.begon";

#Test ln. only link if the second argument doesn't exist
tln () {
	[ -e "$2" ] || (ln -s "$1" "$2" && echo begon \"$2\" >> $begon )
}

#Home test ln. Like tln but assumes everything is relative to $HOME && $self
htln () {
	tln "$self/$1" "$HOME/$2"
}

htln zsh/zshrc .zshrc
htln nano/USE_RC .nanorc
htln nano .mynano
htln X/XCompose .XCompose
htln X/xinitrc .xinitrc
#htln X/xsession .xsession
htln mercurial/hgrc .hgrc
[ -d $HOME/.mplayer ] || mkdir $HOME/.mplayer
htln mplayer/config .mplayer/config
htln icewm .icewm
htln cvs/cvsrc .cvsrc
htln xpdf/xpdfrc .xpdfrc
htln screen/screenrc .screenrc
htln vim/vimrc .vimrc
htln bash/bash_profile_primary.bash .bashrc
htln bash/bash_profile.sh .bash_profile
find $HOME/.mozilla -mindepth 3 -maxdepth 3 -type d -name chrome -exec sh -c "[ -e {}/userChrome.css ] || ln -s $self/firefox/userChrome.css {}/userChrome.css" \;
find $HOME/.mozilla -mindepth 3 -maxdepth 4 -type l -name userChrome.css -exec sh -c "echo begon \"{}/userChrome.css\" >> $begon" \;
sort $begon | uniq  > $begon-temp && mv $begon-temp $begon;
