-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw' })
vim.keymap.set('n', '<leader>pv', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neotree' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line(s) down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line(s) up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join line below' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Move to next search match' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Move to previous search match' })

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste over selection' })

vim.keymap.set('n', '<leader>y', [["+y]], { desc = 'Yank to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to clipboard selected lines' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank to clipboard from cursor to end of line' })

vim.keymap.set('n', '<leader>[', vim.cmd.bp, { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>]', vim.cmd.bn, { desc = 'Next buffer' })

vim.keymap.set(
  'n',
  '<leader>s',
  ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>',
  { desc = 'Search and replace word under cursor' }
)

vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Ex mode' })

vim.keymap.set('v', '<', '<gv', { desc = 'Reduce indent' })
vim.keymap.set('v', '>', '>gv', { desc = 'Increase indent' })

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set('n', '<leader>+', ':resize 5<CR>', { silent = true, noremap = true, desc = 'Increase window height' })
vim.keymap.set('n', '<leader>-', ':resize 5<CR>', { silent = true, noremap = true, desc = 'Decrease window height' })

vim.keymap.set(
  'n',
  '<leader>ti',
  function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({})) end,
  { desc = 'Toggle inlay hints' }
)

vim.keymap.set(
  'n',
  '<leader>l',
  function() require('lint').try_lint() end,
  { desc = 'Trigger linting for current file' }
)

vim.keymap.set('n', '<leader>fn', '<cmd>echo expand("%:p")<CR>', { desc = 'Print filename' })
