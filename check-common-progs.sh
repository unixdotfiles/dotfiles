#!/bin/sh 

#This is meant to quickly check to see if commonly used desktop programs exist on the computer
. zsh/exists.func;

report () {
	__exists "$1" || (echo "$1 is missing"; false;)
}

report xeyes;
report xev;
report port;
report xchat;
report pidgin;
report firefox;
report mgt || printf "\tcheck multi-gnome-terminal";
report geany;
report hg;
report git;
report svn;
report icewm-session;
report mplayer;
report nano;
report links || report lynx; # prefer lynx - but don't report it if we have links
report xmodmap;
