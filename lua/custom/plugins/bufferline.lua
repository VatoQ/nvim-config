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
          delay = 100,
          reveal = { 'close' },
        },
        --indicator = {
        --  icon = '',
        --  style = 'none',
        --},
        buffer_close_icon = '󰅙',
        close_icon = '󰅙 ',
        -- seperator_style = { 'thick', 'slope' },
        separator_style = 'slant',
        -- enforce_regular_tabs = true,
        always_show_bufferline = true,
        tab_size = 20,
        diagnostics = 'nvim_lsp',
        -- diagnostics_update_in_insert = true,
        offsets = {
          text_align = 'left',
          seperator = true,
        },

        color_icons = true,
      },
    }
  end,
}
