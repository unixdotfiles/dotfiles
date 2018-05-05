#!/bin/sh
quit() {
  exit 1
}

trap quit INT

gem install --user-install $(<gem)
gem_user_dir=$(ruby -e 'puts Gem.user_dir')
npm install -g $(<npm)
if [ "$(uname -s)" = "Darwin" ]
  apm install $(<apm)
fi
pip-2.7 install --user -U -r global.requirements.txt -r 27.requirements.txt
pip-3.6 install --user -U -r global.requirements.txt -r 3.requirements.txt
stack install $(<cabal)
#cpan install $(<cpan)
luarocks install $(<luarocks)
cargo install $(<cargo)
