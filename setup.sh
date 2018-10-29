#!/bin/sh

cd "$( dirname "${BASH_SOURCE[0]}" )"
dir=`pwd`

# Set up submodules
git submodule init
git submodule update

# Symlink vimrc & vim into your home directory (i.e. ~/.vimrc and ~/.vim)
cd

if [ ! -L .vimrc ]; then
  if [ -e .vimrc ]; then
    mv .vimrc .vimrc.bak
  fi
  ln -s $dir/vimrc .vimrc
fi

if [ ! -L .gvimrc ]; then
  if [ -e .gvimrc ]; then
    mv .gvimrc .gvimrc.bak
  fi
  ln -s $dir/gvimrc .gvimrc
fi

if [ ! -L .vim ]; then
  if [ -e .vim ]; then
    mv .vim .vim.bak
  fi
  ln -s $dir/vim .vim
fi

# Install plugins
vim +PluginInstall +qall

