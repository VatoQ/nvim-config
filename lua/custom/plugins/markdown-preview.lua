return {
  'iamcco/markdown-preview.nvim',
  ft = { 'markdown' },
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,

  config = function()
    vim.keymap.set('n', '<leader>mp', '<Plut>MarkdownPreviewToggle', { desc = 'Toggle Markdown Preview' })
  end,

  --keys = {
  --  '<leader>mp',
  --  '<cmd>MarkdownPreviewToggle<cr>',
  --  ft = 'markdown',
  --  desc = 'Toggle Markdown Preview',
  --},
}
