#!/bin/bash

PROGRAM=$(basename "$0"); readonly PROGRAM

function usage() {
  cat <<EOS
Generate uuid.
Usage: $PROGRAM [OPTION]...
  -h, --help  Display help
  -u, --upper Generate UUID with uppercase
EOS
}

if [ $# -eq 0 ]; then
  uuidgen | tr -d '\n' | tr "[:upper:]" "[:lower:]"
  exit 0
fi

for OPT in "$@"; do
  case $OPT in
  -h | --help)
    usage
    exit 1
    ;;
  -u | --upper)
    uuidgen | tr -d '\n'
    break
    ;;
  -*)
    echo "$PROGRAM: illegal option -- '$(echo $1 | sed 's/^-*//')'">&2
    exit 1
    ;;
  esac
done
