return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status')
    local function get_venv()
      if vim.bo.filetype ~= 'python' then return '' end

      local venv = vim.env.VIRTUAL_ENV_PROMPT
      if venv then return venv:gsub('[%(%)]', '') end
      return ''
    end

    lualine.setup({
      options = {
        -- theme = "nightfly",
        theme = 'catppuccin-mocha',
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {
          { 'mode', icon = '', padding = 2 },
        },
        lualine_b = {
          {
            'buffers',
            cond = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
          },
        },
        lualine_c = {
          {
            'branch',
            icon = '',
            right_padding = 2,
          },
          {
            'diff',
            colored = true,
          },
          {
            'diagnostics',
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_y = {
          {
            'filetype',
            separator = nil,
          },
          { get_venv, color = { fg = '#fab387', gui = 'bold' } },
        },
        lualine_z = {
          {
            'location',
            icon = '',
            -- separator = { right = "", left = "" },
            padding = 2,
          },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
    })
  end,
}
