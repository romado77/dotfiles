---@type vim.lsp.Config
return {
    cmd = { 'taplo', 'lsp', 'stdio' },
    init_options = { hostInfo = 'neovim' },
    filetypes = { 'toml' },
    root_markers = {
        '.toml',
    },
    settings = {},
}
