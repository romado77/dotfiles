vim.api.nvim_create_user_command('LintInfo', function()
    local filetype = vim.bo.filetype
    local linters = require('lint').linters_by_ft[filetype]

    if linters then
        print('Linters for ' .. filetype .. ': ' .. table.concat(linters, ', '))
    else
        print('No linters configured for filetype: ' .. filetype)
    end
end, {})

return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('lint').linters_by_ft = {
            markdown = { 'vale' },
            javascript = { 'eslint_d' },
            -- typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            -- typescriptreact = { 'eslint_d' },
            python = { 'ruff' },
            rst = { 'sphinx-lint' },
        }
    end,
}
