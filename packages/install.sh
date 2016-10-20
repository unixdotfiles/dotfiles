#!/bin/sh
gem install --user-install $(<gem)
gem_user_dir=$(ruby -e 'puts Gem.user_dir')
[ -f "$gem_user_dir/bin/t" ] && mv "$gem_user_dir/bin/t" "$gem_user_dir/bin/twttr"
sudo npm install -g $(<npm)
apm install $(<apm)
pip-2.7 install --user -U -r global.requirements.txt -r 27.requirements.txt
pip-3.5 install --user -U -r global.requirements.txt -r 3.requirements.txt
cabal update && cabal install $(<cabal)
# cpanm -S -n $(<cpan)
