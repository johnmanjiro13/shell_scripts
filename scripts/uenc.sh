#!/bin/bash

PROGRAM=$(basename "$0"); readonly PROGRAM

function usage() {
  cat <<EOS
Encode url string.
Usage: $PROGRAM <url>
EOS
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

echo "$1" | nkf -WMQ | tr '=' '%' | gsed -z 's/%\n//g'
