#!/bin/bash

set -e

SCRIPTS_PATH="$HOME"/dev/src/github.com/johnmanjiro13/shell_scripts/scripts; readonly SCRIPTS_PATH
SCRIPTS_GITHUB="https://github.com/johnmanjiro13/shell_scripts.git"; readonly SCRIPTS_GITHUB

function download_scripts() {
  if [ ! -d "$SCRIPTS_PATH" ]; then
    git clone "$SCRIPTS_GITHUB"
  fi
}

function install() {
  cd "$SCRIPTS_PATH"
  for script in *.sh; do
    ln -sf "$SCRIPTS_PATH/$script" "/usr/local/bin/${script%.*}"
  done
}

function main() {
  if [ -x "$(which git)" ] && [ -x "$(which curl)" ]; then
    download_scripts && install
  else
    echo "Please install dependencies: ('git', 'curl')"
    exit 1
  fi
}

main
