#!/bin/bash

function usage() {
  cat <<EOS
Usage: $(basename "$0") <target filename> <command>
EOS
}

function check() {
  openssl sha256 -r "$1" | awk '{print $1}'
}

if [ $# -ne 2 ]; then
  usage
  exit 1
fi

echo "watching: $1"
INTERVAL=1 # second
last=$(check "$1")
while true; do
  sleep $INTERVAL
  current=$(check "$1")
  if [ "$last" != "$current" ]; then
    echo 'execute...'
    eval "$2"
    last=$current
    echo 'done'
  fi
done
