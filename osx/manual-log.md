This file documents manual tests to set up a new macOS machine.
It is mostly stuff I should eventually automate but have not yet had time figure out how to do so.

# Software

- [1Password](https://1password.com/)
- [Amphetamine Enhancer](https://github.com/x74353/Amphetamine-Enhancer)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Audacity](https://audacityteam.org/)
- [Background Music](https://github.com/kyleneideck/BackgroundMusic)
- [Calibre](https://calibre-ebook.com/)
- [Clipy](https://github.com/Clipy/Clipy)
- [Discord](https://discord.com/)
- [Dolphin](https://dolphin-emu.org/)
- [Dropbox](https://dropbox.com/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- Focusrite Control
- [Gog galaxy](https://www.gog.com/)
- [Hot](https://xs-labs.com/en/apps/hot/overview/)
- [ICue](https://www.corsair.com/us/en/icue-mac)
- [Iterm](https://www.iterm2.com/)
- [Itsycal](https://www.mowglii.com/itsycal/)
- [Kitty](https://github.com/kovidgoyal/kitty/releases)
- [Jetbrains Toolbox](https://www.jetbrains.com/toolbox/app/)
- [Keycastr](https://github.com/keycastr/keycastr/releases)
- [Macports](https://www.macports.org/)
- [Menu World Time](https://apps.apple.com/us/app/menu-world-time/id1446377255)
- [NoTunes](https://github.com/tombonez/noTunes)
- [Openemu](https://openemu.org/)
- [Pandora](https://www.pandora.com/desktop)
- [SceneBuilder](https://gluonhq.com/products/scene-builder/)
- [Scroll Reverser](https://pilotmoon.com/scrollreverser/)
- [Skim.app](https://skim-app.sourceforge.io/)
- [Slack](https://slack.com/)
- [Steam](https://store.steampowered.com/)
- [StreamDeck](https://www.elgato.com/en/downloads)
- [StreamDeck Google Meet Plugin](https://github.com/ChrisRegado/streamdeck-googlemeet)
- [TailScale](https://tailscale.com/)
- [Textual](https://www.codeux.com/textual/)
- [Transmission](https://transmissionbt.com/)
- [Transmission Remote GUI](https://github.com/transmission-remote-gui/transgui)
- [Unicode Checker](https://earthlingsoft.net/UnicodeChecker/)
- [Virtualbox](https://www.virtualbox.org/)
- [VLC](https://www.videolan.org/vlc/index.html)
- [Wireshark](https://www.wireshark.org/)
- [Yourkit](https://www.yourkit.com/)
- [Zoom](https://zoom.us/)
- [Zotero](https://www.zotero.org)

## LaTeX
- [TeXStudio](https://www.texstudio.org/)
- [MacTex](https://tug.org/mactex/mactex-download.html)


## Proprietary Gaming Software
- [Cityographer](https://worldographer.com)
- [FoundryVTT](https://foundryvtt.com/)
- [Wonderdraft](https://www.wonderdraft.net/)
- [Worldographer](https://worldographer.com)
- [Tiled](https://mapeditor.org)

## Useful Software
- [Jamovi](https://www.jamovi.org/)

## Unused Software
- [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop)
- [Go64](https://www.stclairsoft.com/Go64/)
- [MacTex](https://www.tug.org/mactex/)
- [Openboard](https://openboard.ch)
- [Tunnelblick](https://tunnelblick.net/)

## Games via Launchers
- Baldur's Gate Enhanced Edition
- Baldur's Gate II Enhanced Edition
- Baldur's Gate III
- Divinity - Original Sin 2
- Divinity Original Sin Enhanced Edition
- Divinity Original Sin Enhanced Edition - Soundtrack
- Don't Starve Together
- Eschalon Book 1
- Eschalon Book 2
- Eschalon Book 3
- factorio
- Icewind Dale 2 Complete
- Icewind Dale Enhanced Edition
- Shadowrun Dragonfall - Director's Cut
- The Witcher Enhanced Edition
- TIS-100
- Ultima™ 4 Quest of the Avatar
- Wasteland 3

## Misc Software With Limited Utility

- Android File Transfer
- Authy Desktop
- DriveThruRPG
- lghub
- Opera Developer
- Wineskin Winery
- XMind

# Menu Bar

Enable the following menulets:

- Bluetooth
- Volume
- Input Method
- Battery Status (incl percent)
- Wifi

# Configuration

## Security

- Enable filevault

## System Settings
- Sound > Play user interface sound settings - off
- clear most things from the dock
- change default browser to firefox

## User Profile
Set `/opt/local/bin/zsh` to be my login shell.

# Actions

- Log into 1password
- Log into Dropbox
- Log into Steam
- Log into GOG

## Scripts
```
cd .conf
./install.sh
cd osx
./boot.sh
./osx.sh
cd global
./restore.sh
```


# New Mac In Order

1. Installed updates
1. Installed git / developer tools
1. git clone https://github.com/unixdotfiles/dotfiles .conf
1. Disable ‘show recent applications’ in dock
1. Installed firefox
1. Set up firefox 
1. Installed 1password
1. Logged into 1pssword
1. Installed 1password firefox extension
1. Logged into Firefox
1. ran ~/.conf/osx/osx.sh
1. touch ~/.hushlogin
1. Ran ~/.conf/install.sh
1. Disabled “play sound on startup”
1. Disabled “play user interface sound effects”
1. Changed “Alert Volume” to minimum
1. renamed computer
1. Enable “Use F1, F2, … as standard function keys”
1. Disable “Mission Control”, “Application Window”, “Move Right A Space” and “Move Left a space” keyboard shortcuts as the break ctlr-left/right/down/up in terminal
1. enable "Show Input in menu bar"
1. Enable "correct spelling automatically"
1. Rename hostname of computer
1. Sign into proper wifi
1. Forgot bootstrap wifi
1. Enable install macOS updates
1. Enable download new updates when available
1. Enable install applications from the App Store
1. Install kitty terminal
```
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```
1. Remove iCloud drive from sidebar
1. Sign into apple ID
1. Delete all widgets for macOS
1. Remove stuff from dock
1. Clicked update all for ‘App Store’
1. Enable Accessibility for Dropbox and 1password
1. Install dropbox - https://www.dropbox.com/download
1. Enable Dropbox - but don't sync anything yet
1. Install xcode
1. Optimise battery on battery
1. Enable ‘Show Percentage’ for Battery
1. Install Xcode via app store
1. sudo xcodebuild -license
1. Enable FileVault
1. create ssh key via 1password, export it to disk, add ssh key to github
1. Set up Zotero (install, attachment base, custom cite format, resolver)
1. Install homebrew :(
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
1. Install jetbrains toolbox
1. Install `atuin` and login and sync
