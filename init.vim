syntax on

set clipboard+=unnamedplus

set nocompatible
set encoding=utf-8

" indentation and looks
    set number relativenumber
    set smartindent
    set smartcase
    set incsearch

set splitbelow splitright       " better window splitting
set wildmode=longest            " auto completion

" tabs and stuff
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set nowrap

" removing white spaces
    autocmd BufWritePre * %s/\s\+$//e

" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme='deus'
let g:airline_theme='minimalist'

" remaps

" quick save and exit
    map zz :wq<CR>

