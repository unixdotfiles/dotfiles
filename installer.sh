#! /bin/sh -x
self=$(realpath ~/.conf);

#Test ln. only link if the second argument doesn't exist
tln () {
	[ -e "$2" ] || ln -s "$1" "$2"
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
