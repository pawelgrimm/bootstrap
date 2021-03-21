#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install fonts"
}

function install() {
  # Tap the fonts cask
  brew tap homebrew/cask-fonts
  
  # Main monospace font, patches with glyphs and stuff
  brew install font-jetbrains-mono-nerd-font

  # Some of these casks require svn
  brew install svn

  # Good looking fonts
  brew install font-work-sans
  brew install font-roboto
  brew install font-source-sans-pro
  brew install font-source-serif-pro
  brew install font-source-code-pro
  brew install font-ibm-plex-sans
  brew install font-ibm-plex-serif
  brew install font-ibm-plex-mono
  brew install font-montserrat
  brew install font-abril-fatface 
}
