This file documents manual tests to set up a new macOS machine.
It is mostly stuff I should eventually automate but have not yet had time figure out how to do so.

# Software

- [Macports](https://www.macports.org/)
- [Iterm](https://www.iterm2.com/)
- [Jetbrains Toolbox](https://www.jetbrains.com/toolbox/app/)
- [itsycal](https://www.mowglii.com/itsycal/)
- [Dropbox](https://dropbox.com/)
- [Tunnelblick](https://tunnelblick.net/)
- [Calibre](https://calibre-ebook.com/)
- [Skim.app](https://skim-app.sourceforge.io/)
- [Slack](https://slack.com/)
- [Background Music](https://github.com/kyleneideck/BackgroundMusic)
- [Transmission](https://transmissionbt.com/)
- [1Password](https://1password.com/)
- [VLC](https://www.videolan.org/vlc/index.html)
- [Scroll Reverser](https://pilotmoon.com/scrollreverser/)

# Menu Bar

Enable the following menulets:

- Bluetooth
- Volume
- Input Method
- Battery Status (incl percent)

# Configuration

## User Profile
Set `/opt/local/bin/zsh` to be my login shell.

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