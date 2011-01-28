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
htln mercurial/hgrc .hgrc
[ -d $HOME/.mplayer ] || mkdir $HOME/.mplayer
htln mplayer/config .mplayer/config
htln icewm .icewm
htln cvs/cvsrc .cvsrc
htln xpdf/xpdfrc .xpdfrc
find $HOME/.mozilla -name chrome -type d -mindepth 3 -maxdepth 3 -exec sh -c "[ -e {}/userChrome.css ] || ln -s $self/firefox/userChrome.css {}/userChrome.css" \;
find $HOME/.mozilla -name userChrome.css -type l -mindepth 3 -maxdepth 4 -exec sh -c "echo begon \"{}/userChrome.css\" >> $begon" \;
sort $begon | uniq  > $begon-temp && mv $begon-temp $begon;
