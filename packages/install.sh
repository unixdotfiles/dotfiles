#!/bin/sh
gem install --user-install $(<gem)
npm install -g $(<npm)
apm install $(<apm)
pip-2.7 install --user -U -r global.requirements.txt -r 27.requirements.txt
pip-3.5 install --user -U -r global.requirements.txt -r 3.requirements.txt
# cpanm -S -n $(<cpan)
