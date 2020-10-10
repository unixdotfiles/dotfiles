This file documents manual tests to set up a new macOS machine.
It is mostly stuff I should eventually automate but have not yet had time figure out how to do so.

# Software

- [1Password](https://1password.com/)
- [Amphetamine Enhancer](https://github.com/x74353/Amphetamine-Enhancer)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Background Music](https://github.com/kyleneideck/BackgroundMusic)
- [Calibre](https://calibre-ebook.com/)
- [Clipy](https://github.com/Clipy/Clipy)
- [Dolphin](https://dolphin-emu.org/)
- [Dropbox](https://dropbox.com/)
- [Gog galaxy](https://www.gog.com/)
- [ICue](https://www.corsair.com/us/en/icue-mac)
- [Iterm](https://www.iterm2.com/)
- [Itsycal](https://www.mowglii.com/itsycal/)
- [Jetbrains Toolbox](https://www.jetbrains.com/toolbox/app/)
- [Keycastr](https://github.com/keycastr/keycastr/releases)
- [Macports](https://www.macports.org/)
- [Openboard](https://openboard.ch)
- [Scroll Reverser](https://pilotmoon.com/scrollreverser/)
- [Skim.app](https://skim-app.sourceforge.io/)
- [Slack](https://slack.com/)
- [Steam](https://store.steampowered.com/)
- [Textual](https://www.codeux.com/textual/)
- [Transmission](https://transmissionbt.com/)
- [Tunnelblick](https://tunnelblick.net/)
- [Unicode Checker](https://earthlingsoft.net/UnicodeChecker/)
- [VLC](https://www.videolan.org/vlc/index.html)
- [Wireshark](https://www.wireshark.org/)
- [Yourkit](https://www.yourkit.com/)


## Proprietary Gaming Software
- [Cityographer](https://worldographer.com)
- [FoundryVTT](https://foundryvtt.com/)
- [Wonderdraft](https://www.wonderdraft.net/)
- [Worldographer](https://worldographer.com)

## Useful Software
- [Jamovi](https://www.jamovi.org/)


# Menu Bar

Enable the following menulets:

- Bluetooth
- Volume
- Input Method
- Battery Status (incl percent)
- Wifi

# Configuration

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
