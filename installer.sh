#! /bin/sh -x
self=$(realpath ~/.conf);


[ -e $HOME/.zshrc ] || ln -s $self/zsh/zshrc $HOME/.zshrc
[ -e $HOME/.nanorc ] || ln -s $self/nano/USE_RC $HOME/.nanorc
[ -e $HOME/.mynano ] || ln -s $self/nano/ $HOME/.mynano
