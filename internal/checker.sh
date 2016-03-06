#! /bin/sh
self=~/.conf;

. $self/common_shell/functions.sh

mustexist() {
  pgm="$1"
  __exists "$pgm" || echo "$pgm missing"
}

mustexist git
mustexist hub
mustexist vim
mustexist zsh
