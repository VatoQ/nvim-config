return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local lualine = require 'lualine'

    local git_colors = function()
      --local bg = '#6F686F'
      --local fg = '#CFCFCF'
      --vim.api.nvim_set_hl(0, 'LualineDiffAdd', { fg = fg, bg = bg })
      --vim.api.nvim_set_hl(0, 'LualineDiffChange', { fg = fg, bg = bg })
      --vim.api.nvim_set_hl(0, 'LualineDiffDelete', { fg = fg, bg = bg })
      return {
        fg = '#CFCFCF',
        bg = '#6F686F',
        gui = 'italic',
      }
    end

    --vim.opt.winbar = '%= %#PmenuSel# %t '

    lualine.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        --component_separators = {
        --  left = '',
        --  right = '',
        --},
        --section_separators = {
        --  left = '',
        --  right = '',
        --},
        --component_separators = {
        --  left = '|',
        --  right = '|',
        --},
        --section_separators = {
        --  left = '󰇙',
        --  right = '󰇙',
        --},
        component_separators = '',
        section_separators = '',
        globalstatus = true,
        always_show_tabline = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            color = function()
              local mode = vim.fn.mode()
              local mode_color = {
                n = '#98be65',
                i = '#51afef',
                v = '#c678dd',
                [''] = '#c678dd',
                V = '#c678dd',
                c = '#ff6c6b',
                no = '#98be65',
                s = '#ecbe7b',
                S = '#ecbe7b',
                [''] = '#ecbe7b',
                ic = '#51afef',
                R = '#ff6c6b',
                Rv = '#ff6c6b',
                cv = '#ff6c6b',
                ce = '#ff6c6b',
                r = '#ff6c6b',
                rm = '#ff6c6b',
                ['r?'] = '#ff6c6b',
                ['!'] = '#ff6c6b',
                t = '#ff6c6b',
              }
              local fg_color = {
                n = '#346732',
                i = '#205889',
                v = '#633477',
                [''] = '#633477',
                V = '#633477',
                c = '#883635',
                no = '#445732',
                s = '#765735',
                S = '#765735',
                [''] = '#765735',
                ic = '#205878',
                R = '#883635',
                Rv = '#883635',
                cv = '#883635',
                ce = '#883635',
                r = '#883635',
                rm = '#883635',
                ['r?'] = '#883635',
                ['!'] = '#883635',
                t = '#883635',
              }
              return {
                bg = mode_color[mode] or '#1E1E2E',
                fg = fg_color[mode] or '#FFFFFF',
                gui = 'bold',
              }
            end,
            icons_enabled = true,
            separator = { '' },
            --fmt = function(str)
            --  return str:sub(1, 1)
            --end,
          },
        },

        lualine_b = {
          {
            'branch',
            color = git_colors,
            separator = '',
            on_click = function()
              vim.notify('Clicked!', vim.log.levels.INFO)
            end,
          },
          {
            'diff',
            --on_click = function()
            --  vim.notify('Clicked!', vim.log.levels.INFO)
            --end,
            color = git_colors,
          },
          {
            'diagnostics',
            draw_empty = true,
            color = git_colors,
            separator = '',
          },
        },
        lualine_x = {},
      },
      --tabline = {
      --  lualine_a = {
      --    {
      --      'buffers',
      --      show_filename_only = true,
      --      hide_filename_extension = false,
      --      show_modified_status = true,

      --      max_length = function()
      --        return vim.o.columns
      --      end,

      --      use_mode_colors = true,
      --    },
      --  },
      --},

      winbar = {
        --lualine_x = { 'filetype' },
        lualine_x = {
          {
            'filetype',
            color = {
              bg = '#333333',
            },
            padding = {
              left = 1,
              right = 2,
            },
          },
        },
        lualine_y = { 'fileformat', 'encoding' },
      },
    }
  end,
}
