return {
  'Mofiqul/vscode.nvim',
  lazy = 'true',
  name = 'vscode',
  priority = 1000,

  config = function()
    local colors = require('vscode.colors').get_colors()
    local vscode = require 'vscode'

    vscode.setup {
      transparent = false,

      italic_comments = true,

      italic_inlayhints = true,

      terminal_colors = true,
    }
  end,
}
