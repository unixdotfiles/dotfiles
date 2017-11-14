#!/bin/sh

. ../common_shell/functions.sh

set -x

trap "exit 1" INT

if [ "$(uname -s)" != "Darwin" ]
then
	printf "This script must be run on OSX only"
	exit 1;
fi

# Most of these settings can be set via the GUI, but this allows me to set this
# once and have them 'sync' (in some sense) across devices.

defaults write com.codeux.apps.textual ApplicationCTCPVersionMasquerade -string "telnet"
defaults write com.codeux.apps.textual "ApplyCommandToAllConnections -> clearall" -bool false
defaults write com.codeux.apps.textual "DefaultIdentity -> Realname" -string "Charlie Root"
defaults write com.codeux.apps.textual "DefaultIdentity -> Username" -string "root"
defaults write com.codeux.apps.textual "Keyboard -> Tab Key Completion Suffix" -string ": "
defaults write com.codeux.apps.textual ScrollbackMaximumLineCount -int 16000
defaults write com.codeux.apps.textual TextualDeveloperEnvironment -bool true
defaults write com.codeux.apps.textual MemberListSortFavorsServerStaff -bool true
defaults write com.codeux.apps.textual SaveInputHistoryPerSelection -bool true
defaults write com.codeux.apps.textual ServerListDoubleClickConnectServer -bool true
defaults write com.codeux.apps.textual ServerListDoubleClickJoinChannel -bool true
defaults write com.codeux.apps.textual ServerListDoubleClickLeaveChannel -bool true

defaults write com.agilebits.onepassword4 ShowCopyJSONItemMenu -bool true
defaults write com.agilebits.onepassword4 ShowCopyUUIDItemMenu -bool true
defaults write com.agilebits.onepassword4 ShowItemCounts -bool false
defaults write com.agilebits.onepassword4 ShowRichIcons -bool true
defaults write com.agilebits.onepassword4 ShowStatusItem -bool true

defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper autosubmit -bool false
defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper lenientURLMatch -bool false

defaults write org.openemu.OpenEmu debug -int 1
