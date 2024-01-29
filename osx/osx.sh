#!/bin/sh

. ../common_shell/functions.sh

set -x

trap "exit 1" INT

if [ "$(uname -s)" != "Darwin" ]
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

# Locale & Localization / Get reasonable units
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
defaults write NSGlobalDomain AppleMeasurementUnits -string Centimeters
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleTemperatureUnit -string Celsius

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
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
defaults write com.apple.CrashReporter UseUNC -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden/dot files in Finder by default
# defaults write com.apple.Finder AppleShowAllFiles -bool true

# Finder.app
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder QuitMenuItem -bool true

# Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable various debug menus
defaults write com.apple.addressbook ABShowDebugMenu -bool true
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true
defaults write com.apple.reminders RemindersDebugMenu -boolean true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.dashboard devmode -bool true

# Mail.app
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true

# Safari & WebKit

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Transmission.app
# Create 'incomplete' folder
mkdir -p ~/.transmission/.Incomplete
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/.Incomplete"
# Hide 'donate' message and 'legal' disclaimer
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

# Chess.app
defaults write com.apple.Chess MBCListenForMoves -bool false
defaults write com.apple.Chess MBCSpeakMoves -bool false
defaults write com.apple.Chess MBCDefaultVoice -string "com.apple.speech.synthesis.voice.karen"
defaults write com.apple.Chess MBCAlternateVoice -string "com.apple.speech.synthesis.voice.Victoria"

# Shut Up Safari
defaults write com.apple.Safari DefaultBrowserDateOfLastPrompt -date '2050-01-01T00:00:00Z'
defaults write com.apple.Safari DefaultBrowserPromptingState -int 2
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99

# Disable Photos when plugging in a device
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

defaults write com.apple.menuextra.battery ShowPercent YES

# Java
# This overwrites the dictionary which may not be what is wanted. Included here as a reminder.
# Ideally I could convert most of this script into a checker which outputs the correct output rather
# than blindly running 'default write'.
# defaults write com.oracle.javadeployment /com/oracle/javadeployment/ -dict install.disable.sponsor.offers -string true

# Things to look at:
# nvram systemsetup pmset caffeinate

~/.conf/osx/osx_select.sh
~/.conf/osx/third_party.sh
