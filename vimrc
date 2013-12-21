" Vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Let Vundle manage Vundle!
Bundle 'gmarik/vundle'

"" General plugins
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

"" Haskell plugins
Bundle 'lukerandall/haskellmode-vim'
Bundle 'eagletmt/neco-ghc'

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

" ctrlp
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|target',
"   \ 'file': '\.class$'
"   \ }

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

"" map <C-w>w/p (switch buffer focus) to something nicer
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>w <C-w>w

"" neocomplcache
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_enable_at_startup = 1
set completeopt-=preview

"" NERDTree
autocmd vimenter * if &filetype !=# 'haskell' && &filetype !=# 'idris' | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" sbt quickfix stuff
"" As of sbt-quickfix 0.2.x there is no longer a vim
"" config needed - see https://github.com/dscleaver/sbt-quickfix

"" scala
"" au BufNewFile,BufRead *.scala set shiftwidth=2
"" hi scalaNew gui=underline                                                                                            
"" hi scalaMethodCall gui=italic                                                                                         
"" hi scalaValName gui=underline                                                                                         
"" hi scalaVarName gui=underline

"" show title
set title

"" syntastic
let g:syntastic_idris_checkers=[]
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
