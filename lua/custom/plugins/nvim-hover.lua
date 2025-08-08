return {
  'lewis6991/hover.nvim',
  config = function()
    require('hover').setup {
      init = function()
        require 'hover.providers.lsp'
      end,
      preview_window = true,
    }
    --vim.keymap.set('n', 'K', require('hover').hover, {
    --  desc = 'Hover decumentation',
    --})
  end,
}
