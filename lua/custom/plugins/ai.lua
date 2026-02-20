return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = { accept = false },
      },
      panel = { enabled = false },
    },
  },

  {
    'folke/sidekick.nvim',
    cmd = 'Sidekick',
    keys = {
      { '<C-.>', '<cmd>Sidekick cli toggle<cr>', desc = 'Sidekick' },
      { '<leader>os', '<cmd>Sidekick cli toggle<cr>', desc = 'Sidekick' },
      { '<leader>oa', '<cmd>Sidekick cli prompt<cr>', desc = 'Sidekick Ask' },
      {
        '<Tab>',
        function()
          local ok_nes, Nes = pcall(require, 'sidekick.nes')
          local ok_copilot, copilot = pcall(require, 'copilot.suggestion')
          if ok_nes and Nes.have() then
            Nes.apply()
          elseif ok_copilot and copilot.is_visible() then
            copilot.accept()
          else
            return '<Tab>'
          end
        end,
        desc = 'Accept AI Suggestion',
        mode = 'i',
        expr = true,
      },
    },
    opts = {
      nes = { enabled = true },
      tools = { opencode = { enabled = true } },
    },
  },
}
