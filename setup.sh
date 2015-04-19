#!/bin/bash

this_repo=https://github.com/promptworks/promptworks.vim.git

# Backup .vim directory

cd ~

if [[ -d ~/.vim ]]
then
  # If it's this repo
  if (cd ~/.vim && git remote -v | grep "$this_repo")
  then
    (cd ~/.vim && git pull)
  else
    mv ~/.vim ~/.vim.bak
  fi
else
  # Clone PromptWorks vim config to be the .vim directory
  git clone $this_repo ~/.vim
fi

set -e


# Backup .vimrc unless it's a symlink
[[ -f ~/.vimrc && (! -L ~/.vimrc) ]] && mv ~/.vimrc ~/.vimrc.bak

# Link our vimrc to ~/.vimrc
ln -sF ~/.vim/vimrc ~/.vimrc

# Install vundle plugin
if [[ ! -d ~/.vim/bundle/vundle ]]
then
  git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# Install/Update all other plugins using Vundle
vim -u $HOME/.vim/vimrc.bundles +PluginUpdate +qall
