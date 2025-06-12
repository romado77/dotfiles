return {
  'mbbill/undotree',
  event = 'BufEnter',
  config = function() vim.keymap.set('n', '<leader>tu', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle undotree' }) end,
}
