local config = {
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚',
            [vim.diagnostic.severity.WARN] = '󰀪',
            [vim.diagnostic.severity.INFO] = '󰋽',
            [vim.diagnostic.severity.HINT] = '󰌶',
        },
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    -- virtual_lines = { current_line = true },
    virtual_text = { current_line = true },
    float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
        scope = 'line',
        close_events = {
            'BufLeave',
            'CursorMoved',
            'InsertEnter',
            'FocusLost',
        },
    },
}
vim.diagnostic.config(config)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
