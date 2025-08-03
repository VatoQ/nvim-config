return {
  'mfussenegger/nvim-dap',
  opts = {},
  config = function()
    local dap = require 'dap'
    dap.adapters.python = {
      type = 'executable',
      command = '/usr/bin/python',
      args = { '-m', 'debugpy.adapter' },
    }

    dap.adapters.codelldb = {
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/extension/adapter/codelldb',
      name = 'codelldb',
    }

    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch Python File',
        program = '${file}',
        pythonPath = function()
          return '/usr/bin/python'
        end,
      },
    }

    dap.configurations.c = {
      {
        name = 'Launch C Program',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        ergs = {},
      },
    }
    -- vim.keymap.set('n', '<Leader>dn', function()
    --   vim.cmd 'DapNew'
    -- end, { desc = 'Launch [D]ap[N]ew' })

    vim.keymap.set('n', '<Leader>dr', dap.repl.open)
    vim.keymap.set('n', '<Leader>dl', dap.run_last)
    vim.keymap.set('n', '<F5>', dap.continue)
    vim.keymap.set('n', '<F10>', dap.step_over)
    vim.keymap.set('n', '<F11>', dap.step_into)
    vim.keymap.set('n', '<F12>', dap.step_out)

    vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
    vim.keymap.set('n', '<Leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end)
  end,
}
