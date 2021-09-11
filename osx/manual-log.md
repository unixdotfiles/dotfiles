This file documents manual tests to set up a new macOS machine.
It is mostly stuff I should eventually automate but have not yet had time figure out how to do so.

# Software

- [1Password](https://1password.com/)
- [Amphetamine Enhancer](https://github.com/x74353/Amphetamine-Enhancer)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Background Music](https://github.com/kyleneideck/BackgroundMusic)
- [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop)
- [Calibre](https://calibre-ebook.com/)
- [Clipy](https://github.com/Clipy/Clipy)
- [Discord](https://discord.com/)
- [Dolphin](https://dolphin-emu.org/)
- [Dropbox](https://dropbox.com/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Go64](https://www.stclairsoft.com/Go64/)
- [Gog galaxy](https://www.gog.com/)
- [ICue](https://www.corsair.com/us/en/icue-mac)
- [Iterm](https://www.iterm2.com/)
- [Itsycal](https://www.mowglii.com/itsycal/)
- [Jetbrains Toolbox](https://www.jetbrains.com/toolbox/app/)
- [Keycastr](https://github.com/keycastr/keycastr/releases)
- [Macports](https://www.macports.org/)
- [Openboard](https://openboard.ch)
- [Openemu](https://openemu.org/)
- [Pandora](https://www.pandora.com/desktop)
- [SceneBuilder](https://gluonhq.com/products/scene-builder/)
- [Scroll Reverser](https://pilotmoon.com/scrollreverser/)
- [Skim.app](https://skim-app.sourceforge.io/)
- [Slack](https://slack.com/)
- [Steam](https://store.steampowered.com/)
- [Textual](https://www.codeux.com/textual/)
- [Transmission](https://transmissionbt.com/)
- [Transmission Remote GUI](https://github.com/transmission-remote-gui/transgui)
- [Tunnelblick](https://tunnelblick.net/)
- [Unicode Checker](https://earthlingsoft.net/UnicodeChecker/)
- [Virtualbox](https://www.virtualbox.org/)
- [VLC](https://www.videolan.org/vlc/index.html)
- [Wireshark](https://www.wireshark.org/)
- [Yourkit](https://www.yourkit.com/)
- [Zoom](https://zoom.us/)

## LaTeX
- [MacTex](https://www.tug.org/mactex/)
- [TeXStudio](https://www.texstudio.org/)


## Proprietary Gaming Software
- [Cityographer](https://worldographer.com)
- [FoundryVTT](https://foundryvtt.com/)
- [Wonderdraft](https://www.wonderdraft.net/)
- [Worldographer](https://worldographer.com)

## Useful Software
- [Jamovi](https://www.jamovi.org/)

## Games via Launchers
- Baldur's Gate Enhanced Edition
- Baldur's Gate II Enhanced Edition
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
