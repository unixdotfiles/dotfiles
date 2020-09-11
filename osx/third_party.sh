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
defaults write org.openemu.OpenEmu databasePath -string '~/Dropbox/ApplicationData/OpenEmu/GameLibrary/Game Library'
defaults write org.openemu.OpenEmu databasePath -string '~/Dropbox/ApplicationData/OpenEmu/GameLibrary/Game Library'

# Disable backswipe in chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
defaults write org.chromium.Chromium AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write org.chromium.Chromium AppleEnableMouseSwipeNavigateWithScrolls -bool false

defaults write com.pilotmoon.scroll-reverser ReverseTablet -int 0
defaults write com.pilotmoon.scroll-reverser ReverseTrackpad -int 0
defaults write com.pilotmoon.scroll-reverser SUEnableAutomaticChecks -int 1

defaults write com.googlecode.iterm2 PrefsCustomFolder "/Users/eax/Dropbox/ApplicationData/iterm2prefs"
# Without this preference iTerm2 leaks DNS
defaults write com.googlecode.iterm2 PerformDNSLookups 0

defaults write com.if.Amphetamine "Show Welcome Window" -int 0

launchctl setenv SLACK_DEVELOPER_MENU true
