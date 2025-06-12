return {
    'nvim-lua/plenary.nvim',
    'christoomey/vim-tmux-navigator',
    'lewis6991/gitsigns.nvim',
    'nvim-neotest/nvim-nio',
    { 'folke/neodev.nvim', opts = { lspconfig = false } },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        'lukas-reineke/virt-column.nvim',
        opts = { {
            char = '|',
            virtcolumn = '+1,120',
        } },
    },
    'github/copilot.vim',
    { 'chentoast/marks.nvim', opts = { { force_write_shada = true } } },
}
