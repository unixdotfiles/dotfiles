This file documents manual tests to set up a new macOS machine.
It is mostly stuff I should eventually automate but have not yet had time figure out how to do so.

== Software ==

- Macports
- Iterm
- Jetbrains Toolbox

== Configuration ==

=== TouchID ===
Add
```auth       sufficient     pam_tid.so```
to the *top* of `/etc/pam.d/sudo`

=== User Profile ===
Set `/opt/local/bin/zsh` to be my login shell.

=== Scripts ===
cd .conf
./install.sh
cd osx
./boot.sh
./osx.sh
./osx_select.sh
./third_party.sh
