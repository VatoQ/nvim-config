return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  build = 'make install_jsregexp',

  config = function()
    local ls = require 'luasnip'
  end,
}
