" Environment {
set nocompatible              " be iMproved, required
" }

" Plugins {
so ~/.vim/plugins.vim
" }

syntax enable

scriptencoding utf-8
set mouse=a                 " automatically enable mouse usage
set hidden                      " allow buffer switching without saving
set number        " Line numbers
"set relativenumber    " Relative line numbers
set norelativenumber
set linespace=12   " Macvim specific line height.
" set cursorline                  " highlight current line WARNING: This makes screes redrawing slower
set showmode                    " display the current mode
set noerrorbells visualbell t_vb= " No damn sound
set foldlevelstart=99
set nofoldenable      " disable folding
set complete=.,w,b,u  " set autocompletion to scope: current file, open windows, buffers, unloaded buffers,
set lazyredraw

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
set autoindent

set previewheight=30

" pastetoggle (sane indentation on pastes) with feedback
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
set showmode

set nobackup   " Don't create annoying backup files
set noswapfile " Swap files? Meh.

set textwidth=0 
set wrapmargin=0

"------------Visuals--------------"
set t_CO=256      " use 256 colors on terminal
let g:solarized_termcolors=256

if has('gui_running')
    set background=dark
    colorscheme solarized
    "colorscheme monokai
    "colorscheme atom-dark-256
    "colorscheme zellner

    set guifont=Monaco:h13
    set guioptions-=e    " Minimal tabs no guit tabs
    set guioptions-=l  " Kill those ugly scrollbars
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

	if has('gui_macvim')
        set transparency=5          " Make the window slightly transparent
        set macligatures   " we want pretty symbols when avail
	endif
endif

" We'll fake a custom left padding for each window
hi LineNr guibg=bg
" set foldcolumn=2
hi foldcolumn guibg=bg

" Hide split borders
hi vertsplit guifg=bg guibg=bg

hi SignColumn guibg=bg

"------------Mappings--------------"
let mapleader = ','

"Saves time; maps the spacebar to colon
nmap <space> :

" Curls graphql
map <Leader>z :!curl --request POST --url http://salesrabbitdl2.app/web/graphql/new_mind --header 'api-token: 285' --header 'content-type: application/json' --data '{ "query": "query{ orgUnits (userId: 11699190) {id name}}","variables": null}' \| jq -M<cr>
map <Leader>x :!curl --request POST --url http://salesrabbitdl2.app/web/graphql/new_mind --header 'api-token: 285' --header 'content-type: application/json' --data '{ "query": "query{ orgUnits (userId: 11699190) {id name}}","variables": null}'<cr>

" Edit vimrc file new tab
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" Save file
map <Leader>s :w<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Make Y yank everything from the cursor to end of line
noremap Y y$

" Highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Tab selected sections
vmap <Tab> >gv
vmap <S-Tab> <gv

" Quickfix
nmap <Leader>qq :copen<cr>
nmap <Leader>qc :cclose<cr>

" php lint file - Needed because phpqa breaks tag buffer
nmap <Leader>p :!php -l %<cr>

" Tag
nmap <Leader>f :tag<space>

" Work specific
nmap <Leader>u :!vendor/bin/phpunit % --no-coverage<cr>

" Regen ctags
nmap <Leader>` :!ctags -R --exclude=.git --exclude='*.sql' --exclude='*.sqlite' --exclude=tests --exclude=database --exclude='*.js' --exclude=public<cr>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Sort by length
nmap <Leader>sl ! awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'
vmap <leader>su ! awk -f "{ print length(), $0 \| \"sort -n \| cut -d\\  -f2-\"}"<cr>

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" Allows you to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the mapping
" below pre-fills the current word for you to change.
nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

"------------Plugins--------------"
" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30' "top
let g:ctrlp_extensions = ['buffertag']

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" NERDTree
" prevent NERDTree from hijacking vinegar
let NERDTreeHijackNetrw = 0

" Make NERDTree easier to toggle
nmap <C-k><C-b> :NERDTreeToggle<cr>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
augroup vimrc_php_namespace
    autocmd!
    autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
augroup END

" Ag
let g:ag_highlight=1
nmap <Leader>F :Ag<space>

"spf13/PIV
" Disable code folding
let g:DisableAutoPHPFolding=1

" TagBar {
nnoremap <silent> <leader>tt :TagbarToggle<CR>
nnoremap <silent> <leader>to :TagbarOpen jf<CR>
"}

" API Blueprint
autocmd FileType apiblueprint nmap <leader>eb :call GenerateRefract()<cr>

" Syntastic
let g:syntastic_api_checkers = ['drafter']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"------------Split--------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" Auto Commands"
augroup vimrc_autocmd
	autocmd!
    " source vimrc on save
	autocmd BufWritePost .vimrc source %

    " Keep syntax in sync (hopefully this isn't too slow)
    autocmd BufEnter * :syntax sync fromstart
augroup END


" Auto Save and auto load
" au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
" au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

if has('statusline')
	set laststatus=2

	" Broken down into easy-to-include segments
	set statusline=                            " empty line to facilitate easy moving around of segments
	set statusline+=%W%H%M%R                   " Options
	set statusline+=\ %<%f\  "
	"set statusline+=\ %<%t\  "
	"set statusline+=\ [%{getcwd()}]            " Current directory
	set statusline+=\ %{fugitive#statusline()} " Git Info
	set statusline+=\ [%{&ff}/%Y]              " Filetype

	set statusline+=%=                         " split between left- and right-aligned info"

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

	set statusline+=%-8.(%l,%c%V%)\ %p%%       " file nav info
endif

" ----------------NOTES--------------- "
" ,pd - auto generate php doc
" <C-X><C-O> - omni complete $instance-><C-X><C-O>
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
" J - Bring line below to end of current line
" <leader> tt - Toggle tag bar
" <leader> to - Open tag bar
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
