return {
  'brenoprata10/nvim-highlight-colors',
  opts = {},

  config = function()
    local colors = require 'nvim-highlight-colors'

    colors.setup {
      render = 'virtual',
      virtual_symbol = '',
      virtual_symbol_prefix = '',
      virtual_symbol_suffix = ' ',
      virtual_symbol_position = 'eol',
    }
  end,
}
