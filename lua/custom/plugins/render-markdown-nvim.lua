return {
  'MeanderingProgrammer/render-markdown.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
  },
  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require('render-markdown').setup {
      completions = {
        blink = { enabled = true },
      },
      pipe_table = {
        enabled = true,
        preset = 'round',
        cell = 'padded',
        padding = 1,
      },
    }
  end,
}
