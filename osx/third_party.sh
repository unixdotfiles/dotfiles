#!/bin/sh

. ../common_shell/functions.sh

set -x

trap "exit 1" INT

if [ "$(uname -s)" != "Darwin" ]
then
	printf "This script must be run on OSX only"
	exit 1;
fi

defaults write com.codeux.apps.textual ApplicationCTCPVersionMasquerade -string "telnet"
defaults write com.codeux.apps.textual "ApplyCommandToAllConnections -> clearall" -bool false
defaults write com.codeux.apps.textual "DefaultIdentity -> Realname" -string "Charlie Root"
defaults write com.codeux.apps.textual "DefaultIdentity -> Username" -string "root"
defaults write com.codeux.apps.textual "Keyboard -> Tab Key Completion Suffix" -string ": "
defaults write com.codeux.apps.textual ScrollbackMaximumLineCount -int 16000
defaults write com.codeux.apps.textual TextualDeveloperEnvironment -bool true
