--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Relative numberlines
vim.wo.relativenumber = true

-- Disable ugly line wrapping
vim.opt.wrap = false

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- vim.o.smoothscroll = true

vim.fn.sign_define('DapBreakpoint', {
  text = '🔴',
  texthl = '',
  linehl = '',
  numhl = '',
})

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--

--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set({ 'n', 'i' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set({ 'n', 'i' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set({ 'n', 'i' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set({ 'n', 'i' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local term_nav = function(key)
  return function()
    if vim.fn.mode() == 't' then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n><C-w>' .. key, true, false, true), 'n', false)
    else
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>' .. key, true, false, true), 'n', false)
    end
  end
end

vim.keymap.set({ 'n' }, '<leader>|', '<cmd>:vsplit<cr>')
vim.keymap.set({ 'n' }, '<leader>-', '<cmd>:split<cr>')

vim.keymap.set({ 'n', 'i', 't' }, '<C-h>', term_nav 'h')
vim.keymap.set({ 'n', 'i', 't' }, '<C-l>', term_nav 'l')
vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', term_nav 'j')
vim.keymap.set({ 'n', 'i', 't' }, '<C-k>', term_nav 'k')

vim.keymap.set('n', '<S-h>', '<cmd>bp<cr>', {
  desc = 'Switch to the previous buffer',
})

vim.keymap.set('n', '<S-l>', '<cmd>bn<cr>', {
  desc = 'Switch to the next buffer',
})

vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<cr>', {
  desc = 'Save file',
})

vim.api.nvim_set_hl(0, '@attribute.name', { fg = '#FFD700', bold = true })

vim.api.nvim_set_hl(0, '@attribute.block', { fg = '#AAAAAA' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Function that sets shiftwidth for given filetypes
-- @param filetypes table of strings, filetypes to configure
-- @param opts {expandtab:bool, shiftwidth:int, tabstop:int}
---@param filetypes string[]
---@param opts table<string, (boolean|integer)>
local tab_settings = function(filetypes, opts)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetypes,
    callback = function()
      vim.o.expandtab = opts.expandtab
      vim.o.shiftwidth = opts.shiftwidth
      vim.o.tabstop = opts.tabstop
    end,
  })
end

tab_settings({
  'make',
}, {
  expandtab = false,
  shiftwidth = 4,
  tabstop = 4,
})

tab_settings({
  'lua',
  'yaml',
}, {
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
})

tab_settings({
  'c',
  'h',
  'cpp',
  'hpp',
}, {
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
require('lazy').setup({
  { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
vim.o.background = 'dark'
--require('catppuccin').load 'macchiato'

-- package.loaded['rose-pine.palette'] = nil
-- require('rose-pine').colorscheme()

require('vscode').load 'dark'

local luasnip = require 'luasnip'

vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if luasnip.jumpable(1) then
    return '<Plug>luasnip-jump-next'
  end
  return '<Tab>'
end, {
  expr = true,
  silent = true,
})

vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if luasnip.jumpable(-1) then
    return '<Plug>luasnip-jump-prev'
  end
  return '<S-Tab>'
end, {
  expr = true,
  silent = true,
})

-- COBOL column markers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cobol',
  callback = function()
    -- show line numbers
    vim.wo.number = true
    -- vertical markers at columns 6, 7, 12, 72
    vim.wo.colorcolumn = '1,2,3,4,5,6,8,12,73'
  end,
})

-- Resize splits with Ctrl + Arrow keys
vim.keymap.set({ 'n' }, '<C-Up>', '<cmd>:resize +2<CR>')
vim.keymap.set({ 'n' }, '<C-Down>', '<cmd>:resize -2<CR>')
vim.keymap.set({ 'n' }, '<C-Left>', '<cmd>:vertical resize -2<CR>')
vim.keymap.set({ 'n' }, '<C-Right>', '<cmd>:vertical resize +2<CR>')

require('luasnip.loaders.from_lua').load { paths = { '~/.config/nvim/snippets' } }
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
