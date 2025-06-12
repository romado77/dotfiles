---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim', 'require' },
                disable = { 'missing-fields' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            completion = {
                callSnippet = 'Replace',
            },
            hint = {
                enable = true,
            },
            format = {
                enable = false,
            },
        },
    },
}
