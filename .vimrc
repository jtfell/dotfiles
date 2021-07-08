" Syntax highlighting
syntax on
let g:despacio_Sunset = 1
set guifont=Inconsolata

" Set line numbers relative to current position
set relativenumber 

" Spaces rather than tabs
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

set pastetoggle=<F2>

set undofile
set undodir=~/.vim/undodir

" Install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

"
" General plugins
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'

" Lang-specific plugins
Plug 'shmup/vim-sql-syntax'

" Colorschemes
Plug 'sainnhe/edge'
Plug 'scolsen/bernhard'

call plug#end()

colorscheme bernhard

" Use SQL highlighting for .SQL extension
autocmd BufNewFile,BufRead *.SQL set syntax=sql

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'typescript': ['eslint', 'prettier'],
  \ 'sql': ['sqlint'],
  \ 'json': ['jq'],
\ }
let g:ale_linters = {
  \ 'sql': ['sqlint'],
\ }

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_layout = { 'down': '40%' }

" Nerdtree auto-open on startup with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Key mappings
map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <C-f> :ALEFix<CR>
map <C-w> :set paste<CR>
map <C-e> :set nopaste<CR>

" Aliases
command FormatJson :%!jq '.'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

