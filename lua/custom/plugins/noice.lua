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

  config = function()
    local noice = require 'noice'
    noice.setup {
      cmdline = {
        enabled = true,
        view = 'cmdline_popup',
        format = {
          cmdline = { icon = '󰣇' },
          help = { icon = '󰋗' },
        },
      },
      messages = { enabled = true },
      notify = { enabled = true },
      lsp = {
        progress = { enabled = true },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = true,
          silent = false,
          view = 'hover',
          opts = {
            border = 'rounded',
          },
        },
        signature = {
          enabled = true,
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
        enabled = true,
        kind_icons = true,
      },

      ---@type NoicePresets
      presets = {
        bottom_search = false,
        command_palette = true,
        lsp_doc_border = true,
      },
      markdown = {
        hover = {
          ['|(%S-)|'] = vim.cmd.help,
          ['%[.-%]%((%S-)%)'] = require 'noice.util',
        },
        highlights = {
          ['|%S-|'] = '@text.reference',
          ['@%S+'] = '@parameter',
          ['^%s*(Parameters:)'] = '@text.title',
          ['^%s*(Return:)'] = '@text.title',
          ['^%s*(See also:)'] = '@text.title',
          ['{%S-}'] = '@parameter',
          [':%S-:'] = '@text.title',
        },
      },
    }
  end,
}
