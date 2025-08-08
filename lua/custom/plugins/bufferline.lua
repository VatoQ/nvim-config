return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    vim.opt.termguicolors = true
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        hover = {
          enabled = true,
          delay = 150,
          reveal = { 'close' },
        },
        indicator = {
          icon = '',
          style = 'icon',
        },
        seperator_style = 'thick',
        always_show_bufferline = true,
        tab_size = 20,
        diagnostics = 'nvim_lsp',
        offsets = {
          text_align = 'left',
          seperator = true,
        },
      },
    }
  end,
}
