" Vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Let Vundle manage Vundle!
Bundle 'gmarik/vundle'

"" General plugins
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplcache.vim'

"" Haskell plugins
Bundle 'eagletmt/neco-ghc'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'Twinside/vim-hoogle'

"" Prolog plugins
Bundle 'adimit/prolog.vim'

"" Scala plugins
Bundle 'derekwyatt/vim-scala'

filetype plugin indent on

" Non-Vundle
"" Leader key
let mapleader = ","

"" aliases
command Sz resize 10

"" arrow keys disable
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"" brace completion
set showmatch
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {      {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

"" haskellmode
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

"" horizontal split splits below
set splitbelow

"" indentation
set autoindent
set expandtab
set shiftwidth=4
set smarttab

"" line numbers
set number

"" map <C-w>w (switch buffer focus) to something nicer
nmap <leader>w <C-w>w

"" neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
set completeopt-=preview

"" NERDTree
autocmd vimenter * if &filetype !=# 'haskell' && &filetype !=# 'vim' | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <leader>t :NERDTreeToggle<CR>

"" sbt quickfix stuff
"" As of sbt-quickfix 0.2.x there is no longer a vim
"" config needed - see https://github.com/dscleaver/sbt-quickfix

"" show title
set title

"" syntastic
let g:syntastic_scala_checkers=[]

"" syntax highlighting
syntax on
set t_Co=16
set background=dark
colorscheme solarized

"" wrap textlines
set wrap
set textwidth=80
set formatoptions=qrn1
