syntax on

set encoding=utf-8

" indentation and looks
set number relativenumber

set wildmode=longest            " auto completion

set nowrap

" plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()

let g:airline_theme='deus'
let g:airline_theme='minimalist'

" remaps

" quick save and exit
map zz :wq<CR>
