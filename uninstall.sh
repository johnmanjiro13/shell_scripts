#!/bin/bash

set -e

uninstall() {
  cd ./scripts
  for script in *.sh; do
    unlink "/usr/local/bin/${script%.*}"
  done
}

uninstall
