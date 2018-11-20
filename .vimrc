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

set pastetoggle=<F2>

" TODO: Switch to fzf / rg
" Delegate ctrl:p searching to ag for improved speed
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore node_modules
      \ -g ""'

"
" Syntastic
"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

" Nerdtree auto-open on startup with no files
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Nerdtree on ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Aliases
command FormatJson :%!jq '.'
