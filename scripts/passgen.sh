#!/bin/bash

PROGRAM=$(basename "$0"); readonly PROGRAM

function usage() {
  cat <<EOS
Generate random password.
Usage: $PROGRAM [OPTION]...
  -h, --help   Display help.
  -l, --length Length of the generated password. Default is 10.
EOS
}

if [ $# -eq 0 ]; then
  base64 /dev/random | fold -w 10 | head -n 1
  exit 0
fi

for OPT in "$@"; do
  case $OPT in
  -h | --help)
    usage
    exit 1
    ;;
  -l | --length)
    if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
      echo "$PROGRAM: option requires an argument -- $1">&2
      exit 1
    fi
    base64 /dev/random | fold -w "$2" | head -n 1
    exit 0
    ;;
  -*)
    echo "$PROGRAM: illegal option -- '$(echo $OPT | sed 's/^-*//')'">&2
    exit 1
    ;;
  esac
done
