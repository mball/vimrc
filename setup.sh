#!/bin/sh

cd "$( dirname "${BASH_SOURCE[0]}" )"
dir=`pwd`

# Set up submodules
git submodule init
git submodule update

# Symlink vimrc & vim into your home directory (i.e. ~/.vimrc and ~/.vim)
cd
ln -s $dir/vimrc .vimrc
ln -s $dir/vim .vim
ln -s $dir/gvimrc .gvimrc

# Install plugins
vim +PluginInstall +qall

