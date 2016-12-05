#!/bin/bash -e

this_repo=git@github.com:promptworks/promptworks.vim.git

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
    git clone $this_repo ~/.vim
  fi
else
  # Clone PromptWorks vim config to be the .vim directory
  git clone $this_repo ~/.vim
fi


# Backup .vimrc unless it's a symlink
[[ -f ~/.vimrc && (! -L ~/.vimrc) ]] && mv ~/.vimrc ~/.vimrc.bak

# Link our vimrc to ~/.vimrc
ln -sF ~/.vim/vimrc ~/.vimrc

# Install/Update all other plugins using Vundle
vim -u $HOME/.vim/vimrc.bundles +PlugInstall +qall
