set title
set path+=**			        " searches current directory recursively

set nocompatible		        
set noerrorbells

set tabstop=4 softtabstop=4	    " sets tabs equal to 4 spaces
set shiftwidth=4		        " sets shift width to 4 spaces
set expandtab			        " convert tabs to spaces
set smartindent			        " attempts to properly indent

set showcmd			            " shows current command
set noshowmode			        " shows current mode

if has('syntax')
        filetype on
        syntax on
endif

if has('wildmenu')              " The cool menu when you press tab
        set wildmenu
        set wildchar=<TAB>
endif

if has('cmdline_info')
        set noruler
endif

set undolevels=3000
set number			            " shows line numbers
set relativenumber		        " shows line numbers relative to current position

set nowrap			            " does not allow lines to wrap
set wrapmargin=0

set noswapfile                  " disable swapfile
set nobackup

set ignorecase			        " ignore case when searching
set smartcase			        " turns on case sensitive search when letters are capitalized
set incsearch			        " temporarily highlights the current searched string

set encoding=utf-8

set nohlsearch			        " turns off highlight after enter is pressed when searching

set mouse=a			            " mouse scrolling
set ttymouse=sgr

set clipboard+=unnamedplus	    " sets clipboard so you can paste stuff from outside vim into vim

set completeopt=menuone,longest	" auto complete menu

" load plugins
call plug#begin('~/.vim/plugged')

" colorscheme and theme
Plug 'itchyny/lightline.vim'           " Lightline statusbar
Plug 'frazrepo/vim-rainbow'
Plug 'junegunn/vim-emoji'              " Vim needs emojis!

" Preview colors in vim
Plug 'ap/vim-css-color'

" vim autocomplete
Plug 'vim-scripts/AutoComplPop'

call plug#end()

let g:lightline = {
           \ 'colorscheme': 'wombat',
       \ }

set laststatus=2		        " always show statusline
