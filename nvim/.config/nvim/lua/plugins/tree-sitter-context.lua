-- Show context of the current function
return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufReadPre',
  opts = { mode = 'cursor', max_lines = 3 },
  keys = {
    {
      '<leader>tt',
      function()
        local tsc = require 'treesitter-context'
        tsc.toggle()
      end,
      desc = 'Toggle Treesitter Context',
    },
  },
}
