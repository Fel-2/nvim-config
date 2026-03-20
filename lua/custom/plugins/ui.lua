return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      explorer = { enabled = true },
      terminal = { enabled = true },
      bigfile = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      scroll = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
  ███████╗ ███████╗ ██╗     
  ██╔════╝ ██╔════╝ ██║     
  █████╗   █████╗   ██║     
  ██╔══╝   ██╔══╝   ██║     
  ██║      ███████╗ ███████╗
  ╚═╝      ╚══════╝ ╚══════╝]],
        },
        sections = {
          { section = 'header' },
          {
            section = 'keys',
            gap = 1,
            padding = 1,
            items = {
              { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
              { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
              { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
              { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
              { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
              { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
              { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
            },
          },
          { section = 'startup' },
        },
      },
    },
    keys = {
      { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },
      { '<leader>t', function() Snacks.terminal() end, desc = 'Toggle Terminal' },
      { '<C-/>', function() Snacks.terminal() end, desc = 'Toggle Terminal', mode = { 'n', 't' } },
      { '<leader>sf', function() Snacks.picker.files() end, desc = 'Find Files' },
      { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep Text' },
      { '<leader>sb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
      { '<leader>sn', function() Snacks.picker.notifications() end, desc = 'Notification History' },
      { '<leader>.', function() Snacks.picker.recent() end, desc = 'Recent Files' },
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      return {
        options = {
          theme = 'tokyonight',
          component_separators = '|',
          section_separators = '',
          icons_enabled = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                local ok, api = pcall(require, 'copilot.api')
                if ok and api.status.data.status ~= '' and api.status.data.status ~= 'Idle' then return ' ' .. str end
                return str
              end,
            },
          },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            { 'filename', path = 1 },
          },
          lualine_x = {
            {
              function()
                local ok, api = pcall(require, 'copilot.api')
                if not ok then return '' end
                local status = api.status.data.status
                return ' ' .. (status ~= '' and status or 'Idle')
              end,
              cond = function()
                local ok, clients = pcall(vim.lsp.get_clients, { name = 'copilot' })
                return ok and #clients > 0
              end,
              color = { fg = '#61ffca' },
            },
          },
          lualine_y = {
            {
              function() return '󱜙 NES' end,
              cond = function()
                local ok, sidekick = pcall(require, 'sidekick.nes')
                return ok and sidekick.have()
              end,
              color = { fg = '#ff9e64', gui = 'bold' },
            },
            'progress',
          },
        },
      }
    end,
  },
}
