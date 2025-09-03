local prompts = {
    Explain = 'Please explain how the following code works.',
    Review = 'Please review the following code and provide suggestions for improvement.',
    Tests = {
        prompt = 'Please generate tests',
        system_prompt = 'Please, generate relevant tests for given code. If it is Python, use pytest as test framework',
    },
    Refactor = {
        prompt = 'Refactor code',
        system_prompt = [[Please refactor the following code to improve its
        clarity and readability. Don't forget about docstring and typing for
        function parameters and return values, they are must. Docstring must be
        in ReStructuredText format with not type hints.]],
    },
    FixCode = 'Please fix the following code to make it work as intended.',
    FixError = 'Please explain the error in the following text and provide a solution.',
    BetterNamings = 'Please provide better names for the following variables and functions.',
    Documentation = {
        prompt = 'Doc',
        system_prompt = [[Please provide documentation for the following code.
        If it is Python code, docstring must be in ReStructuredText format with
        no type hints.]],
    },
    Summarize = 'Please summarize the following text.',
    Spelling = 'Please correct any grammar and spelling errors in the following text.',
    Wording = 'Please improve the grammar and wording of the following text.',
    Concise = 'Please rewrite the following text to make it more concise.',
}

return {
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        branch = 'main',
        dependencies = {
            { 'github/copilot.vim' },
            { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
        },
        build = 'make tiktoken',
        opts = {
            question_header = '## User ',
            answer_header = '## Copilot ',
            error_header = '## Error ',
            chat_autocomplete = false,
            mappings = {
                complete = {
                    detail = 'Use @<Tab> or /<Tab> for options.',
                    insert = '',
                },
                close = {
                    normal = 'q',
                    insert = '<C-c>',
                },
                reset = {
                    normal = '<C-x>',
                    insert = '<C-x>',
                },
                submit_prompt = {
                    normal = '<CR>',
                    insert = '<C-CR>',
                },
                accept_diff = {
                    normal = '<C-y>',
                    insert = '<C-y>',
                },
                show_help = {
                    normal = 'g?',
                },
            },
            prompts = prompts,
        },
        config = function(_, opts)
            local chat = require('CopilotChat')
            local select = require('CopilotChat.select')
            local user = vim.env.USER or 'User'
            user = user:sub(1, 1):upper() .. user:sub(2)
            opts.question_header = '  ' .. user .. ' '
            opts.answer_header = '  Copilot '
            opts.selection = function(source) return select.visual(source) or select.buffer(source) end

            chat.setup(opts)

            vim.api.nvim_create_user_command(
                'CopilotChatVisual',
                function(args) chat.ask(args.args, { selection = select.visual }) end,
                { nargs = '*', range = true }
            )

            -- Inline chat with Copilot
            vim.api.nvim_create_user_command(
                'CopilotChatInline',
                function(args)
                    chat.ask(args.args, {
                        selection = select.visual,
                        window = {
                            layout = 'float',
                            relative = 'cursor',
                            width = 1,
                            height = 0.4,
                            row = 1,
                        },
                    })
                end,
                { nargs = '*', range = true }
            )

            -- Restore CopilotChatBuffer
            vim.api.nvim_create_user_command(
                'CopilotChatBuffer',
                function(args) chat.ask(args.args, { selection = select.buffer }) end,
                { nargs = '*', range = true }
            )

            -- Custom buffer for CopilotChat
            vim.api.nvim_create_autocmd('BufEnter', {
                pattern = 'copilot-*',
                callback = function()
                    vim.opt_local.relativenumber = true
                    vim.opt_local.number = true

                    -- Get current filetype and set it to markdown if the current filetype is copilot-chat
                    local ft = vim.bo.filetype
                    if ft == 'copilot-chat' then vim.bo.filetype = 'markdown' end
                end,
            })
        end,
        event = 'VeryLazy',
        keys = {
            {
                '<leader>ap',
                function()
                    require('CopilotChat').select_prompt({
                        context = {
                            'buffers',
                        },
                    })
                end,
                desc = 'CopilotChat - Prompt actions',
            },
            {
                '<leader>ap',
                function() require('CopilotChat').select_prompt() end,
                mode = 'x',
                desc = 'CopilotChat - Prompt actions',
            },
            -- Code related commands
            { '<leader>ae', '<cmd>CopilotChatExplain<cr>', desc = 'CopilotChat - Explain code' },
            { '<leader>at', '<cmd>CopilotChatTests<cr>', desc = 'CopilotChat - Generate tests' },
            { '<leader>ar', '<cmd>CopilotChatReview<cr>', desc = 'CopilotChat - Review code' },
            { '<leader>aR', '<cmd>CopilotChatRefactor<cr>', desc = 'CopilotChat - Refactor code' },
            { '<leader>an', '<cmd>CopilotChatBetterNamings<cr>', desc = 'CopilotChat - Better Naming' },
            -- Chat with Copilot in visual mode
            {
                '<leader>av',
                '<cmd>CopilotChatVisual<cr>',
                mode = 'x',
                desc = 'CopilotChat - Open in vertical split',
            },
            {
                '<leader>ax',
                '<cmd>CopilotChatInline<cr>',
                mode = 'x',
                desc = 'CopilotChat - Inline chat',
            },
            -- Custom input for CopilotChat
            {
                '<leader>ai',
                function()
                    local input = vim.fn.input('Ask Copilot: ')
                    if input ~= '' then vim.cmd('CopilotChat ' .. input) end
                end,
                desc = 'CopilotChat - Ask input',
            },
            -- Generate commit message based on the git diff
            {
                '<leader>am',
                '<cmd>CopilotChatCommit<cr>',
                desc = 'CopilotChat - Generate commit message for all changes',
            },
            -- Quick chat with Copilot
            {
                '<leader>aq',
                function()
                    local input = vim.fn.input('Quick Chat: ')
                    if input ~= '' then vim.cmd('CopilotChatBuffer ' .. input) end
                end,
                desc = 'CopilotChat - Quick chat',
            },
            -- Fix the issue with diagnostic
            { '<leader>af', '<cmd>CopilotChatFixError<cr>', desc = 'CopilotChat - Fix Diagnostic' },
            -- Clear buffer and chat history
            { '<leader>al', '<cmd>CopilotChatReset<cr>', desc = 'CopilotChat - Clear buffer and chat history' },
            -- Toggle Copilot Chat Vsplit
            { '<leader>av', '<cmd>CopilotChatToggle<cr>', desc = 'CopilotChat - Toggle' },
            -- Copilot Chat Models
            { '<leader>a?', '<cmd>CopilotChatModels<cr>', desc = 'CopilotChat - Select Models' },
            -- Copilot Chat Agents
            { '<leader>aa', '<cmd>CopilotChatAgents<cr>', desc = 'CopilotChat - Select Agents' },
        },
    },
}
