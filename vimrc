set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim



syntax enable

let mapleader = ','
set number        " Line numbers
set linespace=4   " Macvim specific line height.
"set shell=/bin/bash  " To fix CtrlP buff ????

"------------Visuals--------------"
colorscheme monokai
set t_CO=256      " use 257 colors on terminal
set guifont=Monaco
" set macligatures   " we want pretty symbols when avail
set guioptions-=e " Minimal tabs no guit tabs
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

"------------Search--------------"
set hlsearch      " highlight search
set incsearch

set guioptions-=l  " Kill those ugly srollbars
set guioptions-=L
set guioptions-=r
set guioptions-=R

" use spaces
set tabstop=4
set expandtab
set shiftwidth=4

"------------Mappings--------------"
"Edit vimrc file new tabe"
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Highligh removal
nmap <Leader><space> :nohlsearch<cr>

" Make NERDTree easier to toggle
nmap <C-k><C-b> :NERDTreeToggle<cr>

nmap <D-p> :CtrlP<cr>
nmap <D-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" Tab selected sections
vmap <Tab> >gv
vmap <S-Tab> <gv

" php lint file
nmap <Leader>p :!php -l %<cr>

" Tag
nmap <Leader>t :tag<space>

" Work specific
nmap <Leader>u :!vendor/bin/phpunit % --no-coverage<cr>

"------------Plugins--------------"
" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30' "top

" NERDTree
let NERDTreeHijackNetrw = 0

" vim-phpqa
" PHP executable (default = "php")
" let g:phpqa_php_cmd='/path/to/php'
" PHP Code Sniffer binary (default = "phpcs")
let g:phpqa_codesniffer_cmd='/Users/mball/.composer/vendor/bin/phpcs'
" PHP Mess Detector binary (default = "phpmd")
let g:phpqa_messdetector_cmd='/Users/mball/.composer/vendor/bin/phpmd'
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0

let g:ctrlp_extensions = ['buffertag']

"------------Split--------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" Auto Commaonds"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" ----------------NOTES--------------- "
" yy - Yank entire line
" zz - Center cursor to screen
" C-w | - Expand split to full screen
" C-w = - Euqalize splits
" :ls - list buffers
" :e - edit a file
" :bd - close current buffer
" vi { - select all text in {
" va { - select all text in { including {
" shift+k - Opens help
" gt :tabnext
" C-w r - swap splits
" :tag sometagname - Go to tag
" :tn - goto next tag
" :tp - goto previous tag
" :ts - tag selector
" C-] - Goto defined tag
" C-^ - Return
"
" vim-vinegar ------------
" - - dir
" % - New File
" d - New Dir
" D - Delete File
"
" vim-multiple-select
" C-n - selects multiple words
"
" Ctags command with excludes
" ctags -R --exclude=.git --exclude='*.sql' --exclude='*.sqlite' --exclude=tests --exclude=database --exclude='*.js'
"
"
" '' - return to last mark
" 'a - 'z		lowercase marks, valid within one file
" 'A - 'Z		uppercase marks, also called file marks, valid between files
" '0 - '9		numbered marks, set from .viminfo file
"
"
" ============================= *fugitive-:Gstatus*
" :Gstatus                Bring up the output of git-status in the preview
"                         window.  The following maps, which work on the cursor
"                         line file where sensible, are provided:
" 
"                         g?    show this help
"                         <C-N> next file
"                         <C-P> previous file
"                         <CR>  |:Gedit|
"                         -     |:Git| add
"                         -     |:Git| reset (staged files)
"                         cA    |:Gcommit| --amend --reuse-message=HEAD
"                         ca    |:Gcommit| --amend
"                         cc    |:Gcommit|
"                         cva   |:Gcommit| --amend --verbose
"                         cvc   |:Gcommit| --verbose
"                         D     |:Gdiff|
"                         ds    |:Gsdiff|
"                         dp    |:Git!| diff (p for patch; use :Gw to apply)
"                         dp    |:Git| add --intent-to-add (untracked files)
"                         dv    |:Gvdiff|
"                         O     |:Gtabedit|
"                         o     |:Gsplit|
"                         p     |:Git| add --patch
"                         p     |:Git| reset --patch (staged files)
"                         q     close status
"                         r     reload status
"                         S     |:Gvsplit|
"                         U     |:Git| checkout
"                         U     |:Git| checkout HEAD (staged files)
"                         U     |:Git| clean (untracked files)
"                         U     |:Git| rm (unmerged files)
" 
