#!/bin/bash

PROGRAM=$(basename "$0"); readonly PROGRAM

function usage() {
  cat <<EOS
Decode url string.
Usage: $PROGRAM <url>
EOS
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

echo "$1" | nkf -w --url-input
