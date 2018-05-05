#!/bin/sh
gem install --user-install $(<gem)
gem_user_dir=$(ruby -e 'puts Gem.user_dir')
npm install -g $(<npm)
apm install $(<apm)
pip-2.7 install --user -U -r global.requirements.txt -r 27.requirements.txt
pip-3.6 install --user -U -r global.requirements.txt -r 3.requirements.txt
stack install $(<cabal)
#cpan install $(<cpan)
luarocks install $(<luarocks)
cargo install $(<cargo)
