#!/bin/sh
quit() {
  exit 1
}

trap quit INT

gem install --user-install $(cat gem)
gem_user_dir=$(ruby -e 'puts Gem.user_dir')
npm install -g $(cat npm)
if [ "$(uname -s)" = "Darwin" ]
then
  apm install $(cat apm)
fi
pip-2.7 install --user -U -r global.requirements.txt -r 27.requirements.txt
pip-3.6 install --user -U -r global.requirements.txt -r 3.requirements.txt
stack install $(cat cabal)
#cpan install $(cat cpan)
luarocks install $(cat luarocks)
cargo install $(cat cargo)
