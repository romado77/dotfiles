return {
    {
        'stevearc/conform.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        lazy = true,
        event = { 'BufRead', 'BufNewFile', 'BufWritePre' },
        cmd = 'ConformInfo',
        keys = {
            {
                '<leader>cf',
                function() require('conform').format() end,
                mode = { 'n', 'v' },
                desc = 'Format file',
            },
        },
        opts = {
            log_level = 1,
            formatters = {
                ruff_sort = {
                    format_on_save = {
                        timeout_ms = 2000,
                    },
                    command = '/Users/rdolgush/.local/share/nvim/mason/bin/ruff',
                    args = { 'check', '--select', 'I', '--fix', '$FILENAME' },
                    stdin = false,
                },
                ruff_format = {
                    format_on_save = {
                        timeout_ms = 2000,
                    },
                    command = '/Users/rdolgush/.local/share/nvim/mason/bin/ruff',
                    args = { 'format', '$FILENAME' },
                    stdin = false,
                },
            },
            formatters_by_ft = {
                bash = { 'beautysh' },
                sh = { 'beautysh' },
                lua = { 'stylua' },
                terraform = { 'hcl' },
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
                typescript = { 'prettierd', 'prettier', stop_after_first = true },
                javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
                typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
                json = { 'prettierd', 'prettier', stop_after_first = true },
                html = { 'prettierd', 'prettier', stop_after_first = true },
                htmlangular = { 'prettierd', 'prettier', stop_after_first = true },
                css = { 'prettierd', 'prettier', stop_after_first = true },
                scss = { 'prettierd', 'prettier', stop_after_first = true },
                yaml = { 'prettierd', 'prettier', stop_after_first = true },
                markdown = { 'prettierd', 'prettier', stop_after_first = true },
                go = { 'goimports', 'gofmt' },
                toml = { 'taplo' },
                python = { 'ruff_sort', 'ruff_format' },
            },
            format_on_save = {
                async = false,
                timeout_ms = 5000,
                lsp_fallback = true,
            },
        },
    },
}
