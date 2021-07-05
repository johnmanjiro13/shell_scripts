#!/bin/bash

PROGRAM=$(basename "$0"); readonly PROGRAM

function usage() {
  cat <<EOS
Display query parameters.
Usage: $PROGRAM <url>
EOS
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

IFS="?" read -ra URL <<< "$1"
echo "${URL[0]}"

IFS='&' read -ra PARAMS <<< "${URL[1]}"
for PARAM in "${PARAMS[@]}"; do
  echo "${PARAM//=/: }"
done
