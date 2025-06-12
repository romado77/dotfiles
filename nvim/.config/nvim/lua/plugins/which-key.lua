return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  enable = true,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 800
  end,
  opts = {},
}
