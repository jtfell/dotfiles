" Syntax highlighting
syntax on
colorscheme despacio
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

call plug#begin('~/.vim/plugged')

"
" General plugins
"
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'

" Lang-specific plugins
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'shmup/vim-sql-syntax'

" Use SQL highlighting for .SQL extension
autocmd BufNewFile,BufRead *.SQL set syntax=sql

call plug#end()

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'typescript': ['tslint', 'prettier'],
  \ 'rust': ['rustfmt'],
  \ 'sql': ['sqlint'],
  \ 'scala': ['scalafmt'],
\ }
let g:ale_linters = {
  \ 'rust': ['rls'],
  \ 'sql': ['sqlint'],
  \ 'scala': ['scalafmt'],
\ }
let g:ale_rust_rls_toolchain = 'stable'

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

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

