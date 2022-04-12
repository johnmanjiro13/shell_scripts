#!/usr/bin/env bash

PROGRAM=$(basename "$0"); readonly PROGRAM

function usage() {
  cat <<EOS
Usage: $PROGRAM <source> <bookmark>
EOS
}

if [ $# -ne 2 ]; then
  usage
  exit 1
fi

# this is inspired by https://threkk.medium.com/how-to-use-bookmarks-in-bash-zsh-6b8074e40774
ln -s "$1" "$HOME/.bookmarks/@$2"
