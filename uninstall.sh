#!/bin/bash

set -e

SCRIPTS_PATH="$HOME"/dev/src/github.com/johnmanjiro13/shell_scripts/scripts; readonly SCRIPTS_PATH

uninstall() {
  cd "$SCRIPTS_PATH"
  for script in *.sh; do
    link="/usr/local/bin/${script%.*}"
    if [ -L "$link" ]; then
      unlink "$link"
    fi
  done
}

uninstall
