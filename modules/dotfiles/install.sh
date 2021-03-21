#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Backup and setup dotfiles"
}

function install() {
  local -r DOTFILES_LIST="vimrc zshrc"
  local -r SCRIPT_PATH="$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    pwd -P
  )"
  local -r DOTFILES_BACKUP=~/dotfiles_old

  # create dotfiles_old in homedir
  echo "Creating $DOTFILES_BACKUP for backup of any existing dotfiles in $HOME"
  mkdir $DOTFILES_BACKUP
  if [[ $? -eq 0 ]]; then
    for FILE in $DOTFILES_LIST; do
      local DESTINATION=~/.$FILE
      echo "Moving .$FILE from $HOME to $DOTFILES_BACKUP"
      # Handle symlinks 
      if [[ -L $DESTINATION ]]; then
        if [[ -e $DESTINATION ]]; then
          # Follow the symlink and copy that file, then remove
          # the symlink
          RESOLVED_DOTFILE=$(readlink $DESTINATION)
          cp $RESOLVED_DOTFILE $DOTFILES_BACKUP/.$FILE
          rm $DESTINATION
        else
          continue
        fi
      else 
        # For normal (non-symlink) files, just move them to the backup
        mv $DESTINATION $DOTFILES_BACKUP/.$FILE
      fi 

      echo "Creating symlink to $FILE in home directory."
      ln -s $SCRIPT_PATH/$FILE $DESTINATION
    done 

    echo "done"
  else  
    echo "Please remove existing $DOTFILES_BACKUP directory"
  fi
}
