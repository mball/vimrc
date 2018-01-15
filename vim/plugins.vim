filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color schemes
"Plugin 'crusoexia/vim-monokai'
"Plugin 'tomasr/molokai'
"Plugin 'dunckr/vim-monokai-soda'
"Plugin 'gosukiwi/vim-atom-dark'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'YorickPeterse/happy_hacking.vim'
"Plugin 'kamwitsta/mythos'
"Plugin 'KeitaNakamura/neodark.vim'
"Plugin 'JarrodCTaylor/spartan'
Plugin 'scwood/vim-hybrid'
"Plugin 'tyrannicaltoucan/vim-deep-space'
"Plugin 'lifepillar/vim-solarized8'
"Plugin 'machakann/vim-colorscheme-tatami'
"Plugin 'zcodes/vim-colors-basic'
"Plugin 'vim-scripts/mayansmoke'
"Plugin 'wolverian/minimal'

" Editer Plugins
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xtal8/traces.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'moll/vim-bbye'

" Syntax checker
Plugin 'vim-syntastic/syntastic'

" Git Plugins
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" PHP
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'spf13/PIV'

" json
Plugin 'elzr/vim-json'

" GraphQL
Plugin 'jparise/vim-graphql'

" Blueprint
Plugin 'kylef/apiblueprint.vim'

" Arduino
Plugin 'sudar/vim-arduino-syntax'

call vundle#end()            " required
filetype plugin indent on    " required
