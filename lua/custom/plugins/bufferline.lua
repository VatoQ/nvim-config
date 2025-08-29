return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    vim.opt.termguicolors = true
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        mode = 'buffers',
        style_preset = bufferline.style_preset.minimal,
        themable = true,
        color_icons = true,
        buffer_close_icon = '',
        close_icon = '',
        indicator = {
          style = 'underline',
          icon = '',
        },
        left_trunc_marker = '',
        modified_icon = '●',
        offsets = {
          {
            --filetype = 'NvimTree',
            --text = 'EXPLORER',
            text_align = 'left',
            seperator = false,
          },
        },
        right_trunc_marker = '',
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = 'thin',
        hover = {
          enabled = true,
          delay = 100,
          reveal = { 'close' },
        },
        enforce_regular_tabs = true,
        ----indicator = {
        ----  icon = '',
        ----  style = 'none',
        ----},
        --buffer_close_icon = '󰅙',
        --close_icon = '󰅙 ',
        ---- seperator_style = { 'thick', 'slope' },
        --separator_style = 'slant',
        ---- enforce_regular_tabs = true,
        --always_show_bufferline = true,
        --tab_size = 20,
        --diagnostics = 'nvim_lsp',
        ---- diagnostics_update_in_insert = true,
        --offsets = {
        --  text_align = 'left',
        --  seperator = true,
        --},

        --color_icons = true,
      },
      highlights = {
        fill = {
          fg = { attribute = 'fg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'StatusLineNC' },
        },
        --background = {
        --  fg = { attribute = 'fg', highlight = 'Normal' },
        --  bg = { attribute = 'bg', highlight = 'StatusLine' },
        --},
        buffer_visible = {
          fg = { attribute = 'fg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'Normal' },
        },
        buffer_selected = {
          fg = { attribute = 'fg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'Normal' },
        },
        separator = {
          fg = { attribute = 'bg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        separator_selected = {
          fg = { attribute = 'fg', highlight = 'Special' },
          bg = { attribute = 'bg', highlight = 'Normal' },
        },
        separator_visible = {
          fg = { attribute = 'fg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'StatusLineNC' },
        },
        close_button = {
          fg = { attribute = 'fg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        close_button_selected = {
          fg = { attribute = 'fg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'Normal' },
        },
        close_button_visible = {
          fg = { attribute = 'fg', highlight = 'Normal' },
          bg = { attribute = 'bg', highlight = 'Normal' },
        },
      },
    }
  end,
}
