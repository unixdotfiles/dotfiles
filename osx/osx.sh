#!/bin/sh

. ../common_shell/functions.sh

set -x

trap "exit 1" INT

if [ $(uname -s) != "Darwin" ]
then
	printf "This script must be run on OSX only"
	exit 1;
fi

# Ask for the administrator password upfront
sudo -v

while true; do sudo -nv; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Display ASCII control characters using caret notation in standard text views
# defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Save to disk rather than icloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable smart quotes and smart dashes as they're annoying
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Keep WiFi on logout
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport en0 prefs DisconnectOnLogout=NO

# Don't show debug text or filename on picture (cmd+option on desktop settings for more info)
defaults write com.apple.dock desktop-picture-show-debug-text -bool false

# Get a developer mode crash dialog
defaults write com.apple.CrashReporter DialogType developer

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show POSIX path in title of Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show hidden/dot files in Finder by default
# defaults write com.apple.Finder AppleShowAllFiles -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar in finder
defaults write com.apple.finder ShowStatusBar -bool true

# Disable AirDrop
defaults write com.apple.NetworkBrowser DisableAirDrop -bool true

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.dashboard devmode -bool true

# Mail.app
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true

###############################################################################
# Safari & WebKit
###############################################################################

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.skype.skype WebKitDeveloperExtras -bool true
defaults write com.skype.skype DisableWebKitDeveloperExtras -bool false

defaults write com.skype.skype IncludeDebugMenu -bool true

###############################################################################
# Chrome
###############################################################################

# Disable backswipe in chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

###############################################################################
# Transmission
###############################################################################

# Create 'incomplete' folder
mkdir -p ~/Downloads/Incomplete
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

# Hide 'donate' message and 'legal' disclaimer
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

###############################################################################
# git
###############################################################################

__exists git && git config --global --replace-all credential.helper osxkeychain

###############################################################################
# macports
###############################################################################

if __exists port
then
sudo port select --set cython cython27
sudo port select --set maven maven3
sudo port select --set python python35
sudo port select --set python2 python27
sudo port select --set python3 python35
sudo port select --set ruby ruby20
sudo port select --set scala scala2.11
sudo port select --set pip pip35
sudo port select --set ipython py35-ipython
sudo port select --set ipython2 py27-ipython
sudo port select --set ipython3 py35-ipython
sudo port select --set gcc mp-gcc5
sudo port select --set llvm mp-llvm-3.5
sudo port select --set mysql mariadb-10.1
sudo port select --set postgresql_select postgresql95
sudo port select --set perl perl5.18-apple.15
sudo port select --set nosetests nosetests27
sudo port select --set postgresql postgresql95
sudo port select --set virtualenv virtualenv35

port select --summary
fi
