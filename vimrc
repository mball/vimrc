""" Environment {
"set nocompatible  " be iMproved, required Update: We don't actually need this
" }

" Plugins {
so ~/.vim/plugins.vim
" }

if !exists("g:syntax_on")
    syntax enable
endif 

set encoding=utf8
scriptencoding utf-8
set mouse=a       " automatically enable mouse usage
set hidden        " allow buffer switching without saving
set number        " Line numbers
"set relativenumber    " Relative line numbers

"set cursorline                  " highlight current line WARNING: This makes screes redrawing slower
"set showmode                    " display the current mode. No need for this with airline
set showcmd
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

" Pulled from sensible.vim https://github.com/tpope/vim-sensible/
set scrolloff=1 " Always show at least one line above/below the cursor
set sidescrolloff=5 " Always show 5 columns right and left
set display+=lastline
set formatoptions+=j " Delete comment character when joining commented lines
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+ " Makes :set list (visible whitespace) prettier
set autoread " Autoload file changes. You can undo by pressing u

" Fast terminal redraw
set ttyfast

"------------Visuals--------------"
set t_Co=256      " use 256 colors on terminal
let g:solarized_termcolors=256

"if has('gui_running')
    " Dark
    set background=dark
    "colorscheme atom-dark-256
    "colorscheme solarized
    "colorscheme monokai
    "colorscheme happy_hacking
    "colorscheme monokai-soda
    "colorscheme mythos
    "colorscheme neodark
    "colorscheme spartan
    colorscheme hybrid
    "colorscheme deep-space
    "colorscheme solarized8_dark
    "colorscheme solarized8_dark_low
    "colorscheme solarized8_dark_high
    "colorscheme solarized8_dark_flat

    " Light
    "set background=light
    "colorscheme zellner
    "colorscheme minimal
    "colorscheme mayansmoke
    "colorscheme subtle_light "(dark/light)
    "colorscheme vim-colors-basic
    "colorscheme vim-colorscheme-tatami
    
    "colorscheme solarized8_light
    "colorscheme solarized8_light_low
    "colorscheme solarized8_light_high
    "colorscheme solarized8_light_flat
"endif

" Veonim config
if exists('veonim')
    set guifont=Hack:h11
endif

if has('gui_running')
    if has("gui_macvim")
        "set macthinstrokes  " Thin text only for gui mac. Looks nice on dark backgrounds
        "set macligatures   " we want pretty symbols when avail Warning: This is slow
        set guifont=Fira\ Code\ Retina:h13
        "set transparency=0       " Make the window slightly transparent
        "set blur=10
    endif
    "set antialias
    "set columnspace=0

    set guifont=Hack:h8
    set guioptions-=e  " Minimaldftabs no gui tabs
    set guioptions-=l  " Remove left-hand scrollbar
    set guioptions-=L  " Remove left-hand scrollbar on vsplit
    set guioptions-=r  " Remove right-hand scrollbar
    set guioptions-=R  " Remove right-hand scrollbar on vsplit
    set guioptions-=T  " Remove toolbar
    set guioptions-=m  " Remove menu bar

    set linespace=2   " Line height

    " We'll fake a custom left padding for each window
    hi LineNr guibg=bg
    " set foldcolumn=2
    hi foldcolumn guibg=bg

    " Hide split borders
    hi vertsplit guifg=bg guibg=bg

    hi SignColumn guibg=bg

    hi Search guibg=DarkGrey
endif

if has('terminal')
    hi Terminal ctermbg=black guibg=black
endif


"------------Mappings--------------"
let mapleader = ','

"Saves time; maps the spacebar to colon
nmap <space> :

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
nmap <Leader>su ! awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'
vmap <leader>su ! awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'<cr>

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

" Shortcut to fix syntax highlighting
nmap <Leader>xx :syntax sync fromstart<cr>

"------------Plugins--------------"
" bbye
nnoremap <Leader>w :Bdelete<CR>
" Close all open buffers but leave panes intact :bufdo :Bdelete

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30' "top
let g:ctrlp_extensions = ['buffertag']

if (executable('rg'))
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <Leader>rr :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" NERDTree
" prevent NERDTree from hijacking vinegar
let NERDTreeHijackNetrw = 0

" Make NERDTree easier to toggle
nmap <C-k><C-b> :NERDTreeToggle<cr>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gvdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gu :Git pull<CR>
nnoremap <silent> <leader>gf :Glog -- %<CR>

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
let g:airline_extensions = ['syntastic', 'tabline', 'ctrlp', 'tagbar', 'branch']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

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

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#show_splits = 1

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'Normal',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'c'  : 'Command',
    \ 'v'  : 'Visual',
    \ 'V'  : 'Visual Line',
    \ '' : 'Visual Block',
    \ 's'  : 'Select',
    \ 'S'  : 'Select',
    \ '' : 'Select',
    \ 't'  : 'Terminal',
    \ }

let g:airline_theme='tomorrow'

" Needed for nerd fonts
let g:airline_powerline_fonts = 1

"------------Split--------------"
set splitbelow
set splitright

" Auto Commands"
augroup vimrc_autocmd
	autocmd!
    " source vimrc on save
	autocmd BufWritePost .vimrc source %

    " Keep syntax in sync (hopefully this isn't too slow)
    "autocmd BufEnter * :syntax sync fromstart
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

" Vdebug settings

"function! SetupDebug()
    "let g:vdebug_options['path_maps'] = {"REMOTE_PROJECT_DIR": "LOCAL_PROJECT_DIR"}
    ""let g:vdebug_options['server'] = "REMOTE_SERVER"
    "source ~/.vim/bundle/vdebug/plugin/vdebug.vim
"endfunction
"autocmd VimEnter * :call SetupDebug()
