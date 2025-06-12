return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    lazy = false,
    opts = {
        window = {
            position = 'current',
        },
        filesystem = {
            bind_to_cwd = true,
            follow_current_file = { enabled = true, leave_dirs_open = false },
            use_libuv_file_watcher = true,
            hijack_netrw_behavior = 'open_current',
        },
        buffers = {
            follow_current_file = { enabled = true, leave_dirs_open = false },
        },
    },
    keys = {
        { '<leader>nT', '<cmd>Neotree toggle<cr>', desc = 'Toggle Neotree' },
        { '<leader>nt', '<cmd>Neotree reveal<cr>', desc = 'Toggle Neotree' },
    },
}
