set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

let mapleader = ','
set number        " Line numbers
set linespace=4   " Macvim specific line height.
set cursorline                  " highlight current line
set showmode                    " display the current mode

"------------Search--------------"
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set hlsearch                    " highlight search terms

set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.

" use spaces
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4      " let backspace delete indent

" pastetoggle (sane indentation on pastes) with feedback
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
set showmode

set nobackup   " Don't create annoying backup files
set noswapfile " Swap files? Meh.

"------------Visuals--------------"
colorscheme monokai
set t_CO=256      " use 256 colors on terminal
set guifont=Monaco
" set macligatures   " we want pretty symbols when avail
set guioptions-=e    " Minimal tabs no guit tabs
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

set guioptions-=l  " Kill those ugly scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=R

"------------Mappings--------------"
" Edit vimrc file new tab
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Save file
map <leader>s :w<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Make NERDTree easier to toggle
nmap <C-k><C-b> :NERDTreeToggle<cr>

nmap <D-p> :CtrlP<cr>
nmap <D-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" Tab selected sections
vmap <Tab> >gv
vmap <S-Tab> <gv

" php lint file - Needed because phpqa breaks tag buffer
nmap <Leader>p :!php -l %<cr>

" Tag
nmap <Leader>t :tag<space>

" Work specific
nmap <Leader>u :!vendor/bin/phpunit % --no-coverage<cr>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" Smooth Scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 8)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 8)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 12)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 12)<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

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


" Auto Commands"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Keep syntax in sync (hopefully this isn't too slow)
autocmd BufEnter * :syntax sync fromstart

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Auto Save and auto load
au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

if has('statusline')
	set laststatus=2

	" Broken down into easy-to-include segments
	set statusline=                            " empty line to facilitate easy moving around of segments
	set statusline+=%W%H%M%R                   " Options
	"set statusline+=\ %<%f\  "
	set statusline+=\ %<%t\  "
	set statusline+=\ [%{getcwd()}]            " Current directory
	set statusline+=\ %{fugitive#statusline()} " Git Info
	set statusline+=\ [%{&ff}/%Y]              " Filetype
	set statusline+=%=                         " split between left- and right-aligned info"
	set statusline+=%-8.(%l,%c%V%)\ %p%%       " file nav info
endif

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
" csi"' - replace double quote with single. works with tags 't'
