call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
"Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
call plug#end()

set title
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

" Some basics:
 	nnoremap c "_c
        set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
" Enable autocompletion:
	set wildmode=longest,list,full
" Goyo
        map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

