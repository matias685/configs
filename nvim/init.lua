local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'lilydjwg/colorizer'
Plug 'feline-nvim/feline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
vim.call('plug#end')

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.foldenable = false

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.cmd('au BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4')

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed'

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.signcolumn = 'no'
vim.opt.cursorline = false

vim.opt.termguicolors = true

vim.mapleader = ' '
vim.g.mapleader = ' '

require('feline').setup()

vim.cmd('au BufReadPost *.zsh,.zshrc set filetype=sh')
vim.cmd('au BufReadPost *.conf set filetype=config')
