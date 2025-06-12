vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.winborder = 'single'
vim.o.relativenumber = true
vim.o.number = true
-- vim.o.winborder = 'rounded'

-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = false
vim.o.smoothscroll = true
vim.o.breakindent = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = '/Users/rdolgush/.config/nvim/undodir'
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.hidden = true

vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 8

vim.o.colorcolumn = '102'

vim.o.updatetime = 500

vim.opt.listchars = { tab = '» ', trail = '·', extends = '»', precedes = '«', nbsp = '␣' }
vim.opt.list = true

--opt.clipboard:append("unnamedplus")

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.iskeyword = vim.o.iskeyword .. ',_'
