" Vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle!
Bundle "gmarik/vundle"

" General plugins
Bundle "bling/vim-airline"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "Shougo/neocomplcache.vim"
Bundle "tpope/vim-fugitive"

" Haskell plugins
Bundle "eagletmt/neco-ghc"
Bundle "lukerandall/haskellmode-vim"
Bundle "Twinside/vim-hoogle"

" Idris plugins
Bundle "idris-hackers/idris-vim"

" Scala plugins
Bundle "derekwyatt/vim-scala"

filetype plugin indent on

" Non-Vundle
" Leader key
let mapleader = ","

" airline
set laststatus=2
let g:airline_left_sep=""
let g:airline_left_alt_sep="|"
let g:airline_right_sep=""
let g:airline_right_alt_sep="|"

" aliases
command Sz resize 10

" arrow keys disable
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <up> <nop>

vnoremap <right> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <up> <nop>

nnoremap j gj
nnoremap k gk

" brace completion
set showmatch
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap []     []

" CtrlP
let g:ctrlp_map="<leader>l"
let g:ctrlp_custom_ignore={"dir": "target"}

" gvim options
if has("gui_running")
    set guicursor+=a:blinkon0

    " Disable scrollbar on vertical split
    set guioptions-=L
endif

" haskellmode
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" horizontal split splits below
set splitbelow

" idris-vim
let g:loaded_syntastic_idris_idris_checker=0

" indentation
set autoindent
set tabstop=4
set softtabstop=4
set expandtab

" line numbers
set number

" map <C-w>w (switch buffer focus) to something nicer
nmap <leader>w <C-w>w

" neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
set completeopt-=preview

" NERDTree
autocmd vimenter * if &filetype !=# "haskell" && &filetype !=# "vim" | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>e gt
nnoremap <leader>q gT

" sbt quickfix - installed via SBT, not Vundle so need to manually add to rtp
set rtp+=~/.vim/bundle/vim-sbt

" show title
set title

" syntastic
let g:syntastic_scala_checkers=[]

" syntax highlighting
set t_Co=256
colorscheme solarized
syntax on
set background=dark

" utf-8 ftw
set encoding=utf-8

" wrap textlines
set colorcolumn=121
set textwidth=120
