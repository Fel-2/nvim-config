return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown', 'mdx' },
    opts = {
      heading = { enabled = true },
      code = { enabled = true, style = 'full' },
      bullet = { enabled = true },
      checkbox = { enabled = true },
      table = { enabled = true },
    },
    keys = {
      { '<leader>om', '<cmd>RenderMarkdown toggle<cr>', desc = 'Toggle Markdown Render' },
    },
  },
}
