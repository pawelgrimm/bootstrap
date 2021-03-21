#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install fonts"
}

function install() {
  local -r SCRIPT_PATH="$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd -P
  )"
  # Change directory to fonts
  pushd $SCRIPT_PATH
    for file in *; do
      if [[ "$file" =~ .*\.(otf|ttf|dfont) ]]; then
        echo "Installing $file"
        cp "$file" /Library/Fonts/
      fi
    done
  popd
}
