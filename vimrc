" Vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle!
Bundle "gmarik/Vundle.vim"

" General plugins
Bundle "bling/vim-airline"
Bundle "kien/ctrlp.vim"
Bundle "ntpeters/vim-better-whitespace"
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

call vundle#end()
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

" ctags
" set tags=./.tags,.tags,./tags,tags
" for tagfile in split(glob('.*tags'), "\n")
"     let &tags .= ',' . tagfile
" endfor

" CtrlP
let g:ctrlp_by_filename=1
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" line numbers
set number

" map <C-w>w (switch buffer focus) to something nicer
nmap <leader>w <C-w>w

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
set completeopt-=preview

" NERDTree
autocmd vimenter * if &filetype !=# "haskell" && &filetype !=# "idris" && &filetype !=# "vim" | NERDTree | endif
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
