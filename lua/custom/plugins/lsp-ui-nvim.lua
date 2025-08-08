return {
  'jinzhongjia/LspUI.nvim',
  config = function()
    require('LspUI').setup {
      hover = {
        enable = true,
        command_enable = true,
        ui = {
          title = 'Hover',
          border = 'rounded',
          winblend = 0,
        },
        keys = {
          quit = 'q',
        },
      },
    }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
      desc = 'LSP Hover',
    })
    --vim.keymap.set('n', 'K', function()
    --  vim.lsp.buf.hover { border = 'rounded ' }
    --end, {
    --  desc = 'LSP Hover',
    --})
  end,
}
