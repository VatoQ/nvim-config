-- lazy.nvim
--print 'Noice is loaded!'
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },

  cmdline = {
    enabled = true,
    view = 'cmdline_popup',
  },

  messages = { enabled = true },

  popupmenu = { enabled = true },

  notify = { enabled = true },

  lsp = {
    progress = { enabled = true },
    hover = { enabled = false },
  },
  override = {
    -- override the default lsp markdown formatter with Noice
    ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
    -- override the lsp markdown formatter with Noice
    ['vim.lsp.util.stylize_markdown'] = false,
    -- override cmp documentation with Noice (needs the other options to work)
    ['cmp.entry.get_documentation'] = false,
  },
  config = function()
    local noice = require 'noice'
    noice.setup {
      cmdline = {
        format = {
          cmdline = { icon = '󰣇' },
          help = { icon = '󰋗' },
        },
      },

      format = {
        level = {
          icons = {
            error = '',
            warn = '',
            info = '',
          },
        },
      },

      popupmenu = {
        kind_icons = true,
      },

      ---@type NoicePresets
      presets = {
        bottom_search = false,
        command_palette = true,
        lsp_doc_border = true,
      },
    }
  end,
}
