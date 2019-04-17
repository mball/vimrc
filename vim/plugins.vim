filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color schemes
"Plugin 'crusoexia/vim-monokai'
"Plugin 'YorickPeterse/happy_hacking.vim'
"Plugin 'scwood/vim-hybrid'
"Plugin 'vim-scripts/mayansmoke'
"Plugin 'wolverian/minimal'
Plugin 'maksimr/Lucius2'

" Editer Plugins
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xtal8/traces.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'moll/vim-bbye'
"Plugin 'ryanoasis/vim-devicons'

" Syntax checker
Plugin 'vim-syntastic/syntastic'

" Git Plugins
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" PHP
"Plugin 'StanAngeloff/php.vim'
"Plugin 'arnaud-lb/vim-php-namespace'
"Plugin 'spf13/PIV'

" Golang
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'

" PS1
Plugin 'PProvost/vim-ps1'

" json
Plugin 'elzr/vim-json'

" GraphQL
" Plugin 'jparise/vim-graphql'

" Blueprint
" Plugin 'kylef/apiblueprint.vim'

" Arduino
" Plugin 'sudar/vim-arduino-syntax'

" Debugger
"Plugin 'joonty/vdebug'

" Database
"Plugin 'tpope/vim-dadbod'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required
