#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Setup vim"
}

function install() {
  local -r SCRIPT_PATH="$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd -P
  )"
  mkdir -p ~/.vim/colors
  cp $SCRIPT_PATH/solarized.vim ~/.vim/colors/
}

