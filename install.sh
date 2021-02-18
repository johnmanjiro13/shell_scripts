#!/bin/bash

set -e

declare -r SCRIPTS_PATH="$HOME"/dev/src/github.com/johnmanjiro13/shell_scripts/scripts
declare -r SCRIPTS_GITHUB="https://github.com/johnmanjiro13/shell_scripts.git"

download_scripts() {
  if [ ! -d "$SCRIPTS_PATH" ]; then
    git clone "$SCRIPTS_GITHUB"
  fi
}

install() {
  cd ./scripts
  for script in *.sh
  do
    ln -sf "$SCRIPTS_PATH/$script" "/usr/local/bin/${script%.*}"
  done
}

main() {
  if [ -x "$(which git)" ] && [ -x "$(which curl)" ]; then
    download_scripts && install
  else
    echo "Please install dependencies: ('git', 'curl')"
    exit 1
  fi
}

main
