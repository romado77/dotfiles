---@type vim.lsp.Config
return {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = {
        '.eslintrc.js',
        '.eslintrc.json',
        'eslintrc.mjs',
        'eslintrc.js',
        'eslintrc.config.mjs',
        'eslintrc.config.js',
        'package.json',
    },
    settings = {
        validate = 'on',
        packageManager = 'npm',
        useESLintClass = false,
        experimental = {
            useFlatConfig = true,
        },
        codeActionOnSave = {
            enable = false,
            mode = 'all',
        },
        format = false,
        quiet = false,
        onIgnoredFiles = 'off',
        rulesCustomizations = {},
        run = 'onType',
        nodePath = '',
        problems = {
            shortenToSingleLine = false,
        },
        workingDirectory = { mode = 'location' },
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = 'separateLine',
            },
            showDocumentation = {
                enable = true,
            },
        },
    },
}
