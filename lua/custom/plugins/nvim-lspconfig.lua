return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    { 'j-hui/fidget.nvim', opts = {} },

    'saghen/blink.cmp',

    'mtshiba/pylyzer',

    'hrsh7th/vscode-langservers-extracted',

    'bash-lsp/bash-language-server',

    'pherrymason/c3-lsp',
  },
  config = function()
    --local lspconfig = require 'lspconfig'
    local executable
    local args
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('<leader>r', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ld', vim.diagnostic.setloclist, 'Show [L]SP [d]iagnostics')
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
        map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
        map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }
    local on_attach = function(client, bufnr)
      vim.keymap.set('n', 'K', function()
        vim.notify('Entering K', vim.log.levels.INFO)
        vim.lsp.buf.hover()
      end, {
        buffer = bufnr,
        desc = 'LSP Hover with Glow',
      })
      vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
        if not (result and result.contents) then
          return
        end

        local markdown = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        markdown = vim.lsp.util.trim_empty_lines(markdown)

        if vim.tbl_isempty(markdown) then
          return
        end

        local tmpfile = vim.fn.tempname() .. '.md'
        vim.fn.writefile(markdown, tmpfile)

        vim.fn.jobstart({ 'glow', tmpfile }, {
          detach = true,
        })
      end
    end

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local servers = {
      -- vimtex = {},
      texlab = {
        settings = {
          forwardSearch = {
            executable = executable,
            args = args,
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            validate = true,
            schemaStore = {
              enable = false,
              url = '',
            },
            schemas = {
              ['https://json.schemastore.org/kustomization.json'] = 'kustomization.{yml,yaml}',
              ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = 'docker-compose*.{yml,yaml}',
              ['https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json'] = 'argocd-application.yaml',
            },
          },
        },
      },
      --c3lsp = {
      --  filetypes = { 'c3' },
      --},
      clangd = {
        filetypes = {
          'c',
          'cpp',
          --'objc',
          --'ojbcpp',
          'cuda',
          'proto',
          'hpp',
          'h',
        },
      },
      bashls = {},
      cssls = {
        filetypes = {
          'css',
          'scss',
          'less',
          'rasi',
        },
        cmd = { 'vscode-css-language-server', '--stdio' },
        settings = {
          css = { validate = true },
          less = { validate = true },
          scss = { validate = true },
        },
      },
      jsonls = {
        cmd = { 'vscode-json-language-server', '--stdio' },
        filetypes = { 'json', 'jsonc' },
      },

      html = {},

      basedpyright = {
        -- on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'strict',
              reportUnnecessaryIsInstance = true,
              reportUnnecessaryCast = true,
              reportUnnecessaryComparison = true,
              reportAssertAlwaysTrue = true,
              reportUndefinedVariable = true,
              reportUnboundVariable = true,
              reportUnhashable = true,
              reportUnreachable = true,
              reportInvalidCast = true,
              enableTypeIgnoreComments = true,
              --strictGenericNarrowing = false,
            },
          },
        },
      },

      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_filter(function(name)
      -- return name ~= 'c3ls'
    end, vim.tbl_keys(servers or {}))
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
      'c3-lsp',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
      automatic_installation = true,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    --vim.lsp.config.c3_lsp = {
    --  cmd = { '/usr/bin/c3lsp' },
    --  filetypes = { 'c3', 'c3i' },
    --  root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
    --  settings = {},
    --}

    --vim.lsp.start {
    --  name = 'c3_lsp',
    --  config = vim.lsp.config.c3_lsp,
    --}

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'c3', 'c3i' },
      callback = function()
        vim.lsp.start {
          name = 'c3lsp',
          cmd = { '/usr/bin/c3lsp' }, -- or use vim.fn.exepath("c3lsp") for auto-detection
          filetypes = { 'c3', 'c3i' },
          root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
          settings = {},
        }
      end,
    })
  end,
}
