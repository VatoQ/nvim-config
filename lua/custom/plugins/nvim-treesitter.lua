-- nvim-treesitter is depricated
return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {}
    require('nvim-treesitter').install { 'elixir', 'heex', 'eex' }
  end,
}
