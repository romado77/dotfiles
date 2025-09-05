return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function()
        local fzf_lua = require('fzf-lua')

        fzf_lua.register_ui_select(function(_, items)
            local min_h, max_h = 0.60, 0.80
            local h = (#items + 4) / vim.o.lines
            if h < min_h then
                h = min_h
            elseif h > max_h then
                h = max_h
            end
            return { winopts = { height = h, width = 0.80, row = 0.40 }, files = { hidden = false } }
        end)
    end,
    keys = {
        { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find Files' },
        { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Live Grep' },
        { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
        { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Tags' },
        { '<leader>fr', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
        { '<leader>ft', '<cmd>FzfLua tags<cr>', desc = 'Tags' },
        { '<leader>fm', '<cmd>FzfLua marks<cr>', desc = 'Marks' },
        { '<leader>fc', '<cmd>FzfLua colorschemes<cr>', desc = 'Colorschemes' },
        { '<leader>fk', '<cmd>FzfLua keymaps<cr>', desc = 'Keymaps' },
        { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', desc = 'Grep current word' },
        { '<leader>fd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Find diagnostics' },
        { '<leader>/', '<cmd>FzfLua lgrep_curbuff<cr>', desc = 'Live grep of current buffer' },
        { '<leader>gr', '<cmd>FzfLua lsp_references<cr>', desc = 'LSP references' },
        { '<leader>gd', '<cmd>FzfLua lsp_definitions<cr>', desc = 'LSP definitions' },
        { '<leader>gD', '<cmd>FzfLua lsp_declarations<cr>', desc = 'LSP declarations' },
        {
            '<leader>ca',
            '<cmd>FzfLua lsp_code_actions<cr>',
            desc = 'LSP code actions',
        },
        { '<leader>d', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document diagnostics' },
    },
}
