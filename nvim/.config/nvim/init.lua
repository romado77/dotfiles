vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.lazy')
require('config.diagnostics')
require('config.lsp')

-- vim.cmd('colorscheme tokyonight')
vim.cmd('colorscheme catppuccin')

-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
