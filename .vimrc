call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'lilydjwg/colorizer'
call plug#end()

set title
let mapleader = " "
set path+=**
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set nowrap
set noswapfile
set nobackup
set smartcase
set incsearch
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number

" Recompile suckless programs automatically
autocmd BufWritePost config.h !sudo make install
" Goyo
map <leader>g :Goyo \| set bg=light \| set linebreak<CR>
