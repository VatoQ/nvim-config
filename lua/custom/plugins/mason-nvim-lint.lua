return {
  'williamboman/mason.nvim',
  'mfussenegger/nvim-lint',
  'rshkarin/mason-nvim-lint',

  setup = function()
    require('mason-nvim-lint').setup {}

    local lint = require 'lint'
    lint.linters_by_ft = {
      python = { 'pylint' },
    }

    lint.linters.pylint.cmd = 'python'
    lint.linters.pylint.args = {
      '-m',
      'pylint',
      '-f',
      'json',
      '--from-stdin',
      vim.api.nvim_buf_get_name(0),
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
