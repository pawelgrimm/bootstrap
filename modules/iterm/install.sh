#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install iTerm2"
  echo "   🛠  Configure iTerm"
}

function install() {
  local -r SCRIPT_PATH="$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd -P
  )"
  local -r iterm_path="/Applications/iTerm.app"
  if [ -d "$iterm_path" ]; then
    echo "iTerm2 is already installed at $iterm_path"
  else
    echo "Installing iTerm2..."
    brew install --cask iterm2
    echo "iTerm2 installed."

    echo "Configuring iTerm"
    defaults write com.googlecode.iterm2 PrefsCustomFolder $SCRIPT_PATH
    echo "Custom iTerm preferences enabled."
  fi
}
