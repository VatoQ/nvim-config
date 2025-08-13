return {
  'MeanderingProgrammer/render-markdown.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
  },
  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    --vim.api.nvim_create_autocmd('FileType', {
    --  pattern = 'noice',
    --  callback = function()
    --    require('render-markdown').render()
    --  end,
    --})
    vim.api.nvim_create_autocmd({ 'FileType', 'BufWinEnter' }, {
      desc = 'Set filetype of Noice hover to markdown',
      callback = function(args)
        local win_cfg = vim.api.nvim_win_get_config(0)

        if win_cfg.relative == '' then
          return
        end

        local current_ft = vim.bo.filetype

        if current_ft == 'noice' or current_ft == 'notify' then
          vim.schedule(function()
            if vim.api.nvim_win_get_config(0).relative ~= '' and (vim.bo.filetype == 'noice' or vim.bo.filetype == 'notify') then
              vim.bo.filetype = 'markdown'
              vim.wo.conceallevel = 2
              vim.wo.spell = true
            end
          end)
        end
      end,
    })

    require('render-markdown').setup {
      completions = {
        blink = { enabled = true },
      },
      pipe_table = {
        enabled = true,
        preset = 'round',
        cell = 'padded',
        padding = 1,
      },
      heading = {
        enabled = true,
        icons = { '󰲡', '󰲣', '󰲥', '󰲧', '󰲩', '󰲫' },
        position = 'overlay',
        width = 'full',
        border = true,
      },
      file_types = {
        'markdown',
        'markdown_inline',
        'noice',
      },
    }
  end,
}
