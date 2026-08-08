return {
  'kkoomen/vim-doge',
  lazy = false,
  build = ':call doge#install()',
  opts = {},
  config = function()
    vim.g.doge_enable_mappings = 0
    vim.g.doge_doc_standard_python = 'reST'
    vim.g.doge_doc_standard_c = 'doxygen_javadoc'
  end,
}
----python:
-- sphinx
-- numpy
-- doxygen
-- google
-- reST
