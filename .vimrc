set title
set path+=**			        " searches current directory recursively

set nocompatible		        " necessary for several cool vim things
set noerrorbells

set tabstop=4 softtabstop=4	    " sets tabs equal to 4 spaces
set shiftwidth=4		        " sets shift width to 4 spaces
set expandtab			        " convert tabs to spaces
set smartindent			        " attempts to properly indent

set showcmd			            " shows current command
set showmode			        " shows current mode

filetype plugin on
syntax on

set number			            " shows line numbers
set relativenumber		        " shows line numbers relative to current position

set nowrap			            " does not allow lines to wrap
set noswapfile

set ignorecase			        " ignore case when searching
set smartcase			        " turns on case sensitive search when letters are capitalized
set incsearch			        " sets incremental search

set encoding=utf-8

set nohlsearch			        " turns off highlight after enter is pressed when searching

set mouse=a			            " mouse scrolling

set clipboard+=unnamedplus	    " sets clipboard so you can paste stuff from outside vim into vim

set completeopt=menuone,longest	" auto complete menu

" plugins
call plug#begin('~/.vim/plugged')

" colorscheme and theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mengelbrecht/lightline-bufferline'

" File Manager incorporation
Plug 'preservim/nerdtree'

" Preview colors in vim
Plug 'https://github.com/ap/vim-css-color'

" vim autocomplete
Plug 'vim-scripts/AutoComplPop'

call plug#end()

let g:airline_theme='violet'

set laststatus=2		        " always show statusline

map zz :wq<CR>
