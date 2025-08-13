return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    --vim.cmd 'colorscheme rose-pine'
    local rose_pine = require 'rose-pine'
    rose_pine.setup {
      variant = 'moon',
      dark_variant = 'moon',
      dim_inactive_windows = true,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
    }
  end,
}
