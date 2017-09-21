" Environment {
"set nocompatible  " be iMproved, required Update: We don't actually need this
" }

" Plugins {
so ~/.vim/plugins.vim
" }

if !exists("g:syntax_on")
    syntax enable
endif 

set encoding=utf-8
scriptencoding utf-8
set mouse=a                 " automatically enable mouse usage
set hidden                      " allow buffer switching without saving
set number        " Line numbers
set relativenumber    " Relative line numbers
"set norelativenumber
"
" set cursorline                  " highlight current line WARNING: This makes screes redrawing slower
"set showmode                    " display the current mode. No need for this with airline
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
"set tabstop=4 // It is recommended we don't change this value. Default is 8
set expandtab
set shiftwidth=4
set softtabstop=4      " let backspace delete indent
set autoindent

set previewheight=30

" pastetoggle (sane indentation on pastes) with feedback
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>

set nobackup   " Don't create annoying backup files
set noswapfile " Swap files? Meh.

set textwidth=0 
set wrapmargin=0


" Fast terminal redraw
set ttyfast

"------------Visuals--------------"
set t_CO=256      " use 256 colors on terminal
let g:solarized_termcolors=256

if has('gui_running')
    set background=dark
    "colorscheme solarized
    "colorscheme monokai
    "colorscheme atom-dark-256
    "colorscheme zellner
    "colorscheme happy_hacking
    "colorscheme monokai-soda
    "colorscheme mythos
    "colorscheme neodark
    "colorscheme spartan
    colorscheme hybrid
    "colorscheme deep-space

    set guifont=Fira\ Code\ Retina:h13
    set guioptions-=e    " Minimal tabs no gui tabs
    set guioptions-=l  " Kill those ugly scrollbars
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=T

	if has('gui_macvim')
        set transparency=4       " Make the window slightly transparent
        set blur=10
        set macligatures   " we want pretty symbols when avail
        set antialias
        set linespace=5   " Macvim specific line height.
        set columnspace=0
        set macthinstrokes  " Thin text only for gui mac. Looks nice on dark backgrounds
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
map <Leader>zz :!curl --request POST --url http://salesrabbitdl2.app/web/graphql --header 'api-token: 285' --header 'content-type: application/json' --data '{ "query": "query{ forms {id name fields {id} groups {id}}}","variables": null}' \| jq -M<cr>
"map <Leader>zx :!curl --request POST --url http://salesrabbitdl2.app/web/graphql --header 'api-token: 285' --header 'content-type: application/json' --data '{ "query": "query{ orgUnits (userId: 11699190) {id name}}","variables": null}'<cr>
map <Leader>zx :!curl --request POST --url http://salesrabbitdl2.app/web/graphql --header 'api-token: 285' --header 'content-type: application/json' --data '{ "query": "query{ forms {id name fields {id} groups {id}}}","variables": null}'<cr>
map <Leader>zi :!curl --request POST --url http://salesrabbitdl2.app/web/graphql --header 'api-token: 285' --header 'content-type: application/json' --data '{ "query": "{ __schema { queryType { name, kind, description, fields { description deprecationReason } } } }"}' \| jq -M<cr>
map <Leader>zm :!curl --request POST --url http://salesrabbitdl2.app/web/graphql --header 'api-token: 285' --header 'content-type: application/json' --data '{ "query": "mutation { createForm (input: {name: \"test\", type: \"type\", format: \"formats\", published: false}) { form { id } } }"}'<cr>

function! GraphQL(query, jq)
    if a:jq == 1
        let jq = " | jq -M"
    else
        let jq = ""
    endif

    echom a:query
    exe "!curl -X POST -v http://salesrabbitdl2.app/web/graphql -H 'Api-Token: 285' -H 'Content-Type: application/json' --data '{ \"query\": \"" . a:query . "\"}'" . jq
endfunction

function! MakeSession()
    exe "mksession! .vim.session"
endfunction

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

" Searching
nmap <Leader>ft :tag<space>
nnoremap <Leader>fc :Ag <C-r><C-w>
vnoremap <Leader>fc y:Ag <C-r>"

" Work specific
nmap <Leader>u :!vendor/bin/phpunit % --no-coverage<cr>

" Regen ctags
nmap <Leader>` :!ctags -R --exclude=.git --exclude='*.sql' --exclude='*.sqlite' --exclude=tests --exclude=database --exclude='*.js' --exclude=public<cr>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Sort by length
nmap <Leader>sl ! awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'
vmap <leader>su ! awk -f "{ print length(), $0 \| \"sort -n \| cut -d\\  -f2-\"}"<cr>

" Toggle comments
vmap <D-/> <Leader>c<Space>

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
let g:syntastic_php_checkers = ['php', 'phpmd', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=PSR2,PSR1'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" airline
set laststatus=2   " need to enable it 
let g:airline_extensions = ['syntastic', 'tabline', 'ctrlp']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#tab_nr_type = 2 " display splits and tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1 " use more standard tab shortcuts
nmap <D-1> <Plug>AirlineSelectTab1
nmap <D-2> <Plug>AirlineSelectTab2
nmap <D-3> <Plug>AirlineSelectTab3
nmap <D-4> <Plug>AirlineSelectTab4
nmap <D-5> <Plug>AirlineSelectTab5
nmap <D-6> <Plug>AirlineSelectTab6
nmap <D-7> <Plug>AirlineSelectTab7
nmap <D-8> <Plug>AirlineSelectTab8
nmap <D-9> <Plug>AirlineSelectTab9
nmap <D--> <Plug>AirlineSelectPrevTab
nmap <D-+> <Plug>AirlineSelectNextTab

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

let g:airline_left_sep = '⮀'

" let g:airline_mode_map = {
"      \ '__' : '-',
"      \ 'n'  : 'Normal',
"      \ 'i'  : 'Insert',
"      \ 'R'  : 'Replace',
"      \ 'c'  : 'Command',
"      \ 'v'  : 'Visual',
"      \ 'V'  : 'Visual Line',
"      \ '' : 'Visual Block',
"      \ 's'  : 'Select',
"      \ 'S'  : 'Select',
"      \ '' : 'Select',
"      \ }



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

" Session handler found https://www.reddit.com/r/vim/comments/6zcq87/vim_sessions_new_to_me_never_heard_of_it_but_am/dmuj06o/
"" Session
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>

" Modified to drop sessions in current working dir.
set ssop-=options       " do not store options (vimrc) in a session
"" Make and load method to save session per dir
function! MakeSession()
    exe "mksession! .vim.session"
endfunction
function! LoadSession()
    let b:sessionfile = ".vim.session"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif

endfunction

" Auto-commands 
"augroup autosourcing
    "if(argc() == 0)
        ""au VimEnter * nested :call LoadSession() " Uncomment to automatically load session
        "au VimLeave * :call MakeSession()
    "endif
"augroup END


" Auto Save and auto load
" au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
" au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

" if has('statusline')
"     set laststatus=2
" 
"     " Broken down into easy-to-include segments
"     set statusline=                            " empty line to facilitate easy moving around of segments
"     set statusline+=%W%H%M%R                   " Options
"     set statusline+=\ %<%f\  "
"     "set statusline+=\ %<%t\  "
"     "set statusline+=\ [%{getcwd()}]            " Current directory
"     set statusline+=\ %{fugitive#statusline()} " Git Info
"     set statusline+=\ [%{&ff}/%Y]              " Filetype
" 
"     set statusline+=%=                         " split between left- and right-aligned info"
" 
"     set statusline+=%#warningmsg#
"     set statusline+=%{SyntasticStatuslineFlag()}
"     set statusline+=%*
" 
"     set statusline+=%-8.(%l,%c%V%)\ %p%%       " file nav info
" endif

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
" C-n - Toggles number mode
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
