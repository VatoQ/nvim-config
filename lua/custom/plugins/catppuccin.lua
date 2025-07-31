return {
  'catppuccin/nvim',
  lazy = true,
  name = 'catppuccin',
  priority = 1000,

  config = function()
    -- ---@diagnostic disable-next-line: missing-fields
    --require('catppuccin').setup {
    --  styles = {
    --    comments = { italic = true },
    --  },
    --  -- custom_highlights = function(c)
    --  --   return {
    --  --     ['@lsp.typemod.function.builtin'] = { fg = C.peach },
    --  --   }
    --  -- end,
    --}
    require('catppuccin').setup {
      flavour = 'macchiato',
      auto_integrations = true,

      background = {
        light = 'latte',
        dark = 'macchiato',
      },

      transparent_background = false,

      show_end_of_buffer = true,

      styles = {
        comments = { 'bold' },
      },
      integrations = {
        snacks = {
          enabled = true,
          picker_style = 'classic',
        },
        which_key = true,
      },
    }

    require('catppuccin').load()
  end,
}
