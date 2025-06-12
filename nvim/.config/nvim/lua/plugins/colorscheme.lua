return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = 'macchiato', -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = 'latte',
                    dark = 'mocha',
                },
                transparent_background = true,
                show_end_of_buffer = false, -- show the '~' characters after the end of buffers
                term_colors = true,
                dim_inactive = {
                    enabled = false,
                    shade = 'dark',
                    percentage = 0.15,
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                styles = {
                    comments = { 'italic' },
                    conditionals = { 'italic' },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                color_overrides = {
                    macchiato = {
                        base = '#000000',
                        mantle = '#000000',
                        crust = '#000000',
                    },
                },
                custom_highlights = function(colors)
                    return {
                        ColorColumn = { bg = colors.flamingo },
                    }
                end,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    fzf = true,
                    harpoon = true,
                    mason = true,
                    dap = true,
                    treesitter = true,
                    lsp_trouble = true,
                    notify = false,
                    noice = false,
                },
            })
        end,
    },
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            local transparent = true

            local bg = '#011628'
            local bg_dark = '#011423'
            local bg_highlight = '#143652'
            local bg_search = '#0A64AC'
            local bg_visual = '#275378'
            local fg = '#CBE0F0'
            local fg_dark = '#B4D0E9'
            local fg_gutter = '#627E97'
            local border = '#547998'

            require('tokyonight').setup({
                style = 'night',
                transparent = transparent,
                styles = {
                    sidebars = transparent and 'transparent' or 'dark',
                    floats = transparent and 'transparent' or 'dark',
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    fzf = true,
                    harpoon = true,
                    mason = true,
                    dap = true,
                    treesitter = true,
                    lsp_trouble = true,
                },
                on_colors = function(colors)
                    colors.bg = bg
                    colors.bg_dark = transparent and colors.none or bg_dark
                    colors.bg_float = transparent and colors.none or bg_dark
                    colors.bg_highlight = bg_highlight
                    colors.bg_popup = bg_dark
                    colors.bg_search = bg_search
                    colors.bg_sidebar = transparent and colors.none or bg_dark
                    colors.bg_statusline = transparent and colors.none or bg_dark
                    colors.bg_visual = bg_visual
                    colors.border = border
                    colors.fg = fg
                    colors.fg_dark = fg_dark
                    colors.fg_float = fg
                    colors.fg_gutter = fg_gutter
                    colors.fg_sidebar = fg_dark
                end,
            })
        end,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                variant = 'auto', -- auto, main, moon, or dawn
                dark_variant = 'main', -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },

                groups = {
                    border = 'muted',
                    link = 'iris',
                    panel = 'surface',

                    error = 'love',
                    hint = 'iris',
                    info = 'foam',
                    note = 'pine',
                    todo = 'rose',
                    warn = 'gold',

                    git_add = 'foam',
                    git_change = 'rose',
                    git_delete = 'love',
                    git_dirty = 'rose',
                    git_ignore = 'muted',
                    git_merge = 'iris',
                    git_rename = 'pine',
                    git_stage = 'iris',
                    git_text = 'rose',
                    git_untracked = 'subtle',

                    h1 = 'iris',
                    h2 = 'foam',
                    h3 = 'rose',
                    h4 = 'gold',
                    h5 = 'pine',
                    h6 = 'foam',
                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })
        end,
    },
    {
        'webhooked/kanso.nvim',
        lazy = false,
        priority = 1000,
    },
}
