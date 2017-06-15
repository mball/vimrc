filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color schemes
Plugin 'crusoexia/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'dunckr/vim-monokai-soda'
Plugin 'gosukiwi/vim-atom-dark'

" Editer Plugins
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'

" Git Plugins
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" PHP
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'spf13/PIV'
" Plugin 'joonty/vim-phpqa'

" json
Plugin 'elzr/vim-json'

call vundle#end()            " required
filetype plugin indent on    " required
