return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.3.1',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            nerd_font_variant = 'mono',
            use_nvim_cmp_as_default = true,
        },

        completion = {
            trigger = {
                prefetch_on_insert = false,
                show_on_keyword = false,
            },
            documentation = {
                auto_show = true,
                -- window = {
                --     -- border = 'rounded',
                -- },
            },
            -- menu = { border = 'rounded' },
            ghost_text = { enabled = false },
        },

        signature = {
            enabled = true,
            -- window = { border = 'rounded' },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                path = {
                    opts = { get_cwd = vim.uv.cwd },
                },
                buffer = {
                    fallbacks = {}, -- disable being fallback for LSP
                    max_items = 4,
                    min_keyword_length = 4,
                    score_offset = -3,
                },
            },
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
    build = 'cargo build --release',
}
