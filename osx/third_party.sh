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

# Enable various debug menus
defaults write com.skype.skype IncludeDebugMenu -bool true

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

defaults write com.mowglii.ItsycalApp UseOutlineIcon -int 1

# LaunchControl
defaults write com.soma-zone.LaunchControl changeLabelWhenRename -bool true
defaults write com.soma-zone.LaunchControl dyakAboutTooltips -bool false
defaults write com.soma-zone.LaunchControl paid -bool true
defaults write com.soma-zone.LaunchControl warnAboutDeprecatedKeys -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write com.skype.skype WebKitDeveloperExtras -bool true
defaults write com.skype.skype DisableWebKitDeveloperExtras -bool false

# hide bluesnooze icon
defaults write com.oliverpeate.Bluesnooze hideIcon -bool true

launchctl setenv SLACK_DEVELOPER_MENU true

# Transmission.app
# Create 'incomplete' folder
mkdir -p ~/.transmission/.Incomplete
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/.Incomplete"
# Hide 'donate' message and 'legal' disclaimer
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

