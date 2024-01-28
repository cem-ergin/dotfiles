require("cem.lazy")
require("lazy").setup({
  { "folke/neoconf.nvim",        cmd = "Neoconf" },
  "folke/neodev.nvim",
  'nvim-lua/plenary.nvim',
  require('cem.leap'),
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  require('cem.lspconfig'),
  require('cem.conform'),
  require('cem.nvimcmp'),
  require('cem.nvimlint'),
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
  require('cem.trouble'),
  require('cem.xcode'),
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
})

vim.cmd("set clipboard=unnamedplus")
vim.o.undofile = true
vim.o.showmode = false
vim.o.updatetime = 50
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.whichwrap = "bs<>[]hl"
vim.o.clipboard = 'unnamedplus'

vim.o.timeout = false

local map = vim.keymap.set

-- Misc
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "<leader>e", vim.cmd.Ex, { desc = "File e[x]plorer", noremap = true })


local map = vim.keymap.set
local code = require('vscode-neovim')

map("n", "[d", "<Cmd>lua require('vscode-neovim').action('editor.action.marker.prev')<CR>")
map("n", "]d", "<Cmd>lua require('vscode-neovim').action('editor.action.marker.next')<CR>")
map("n", "gD", "<Cmd>lua require('vscode-neovim').action('editor.action.revealDeclaration')<CR>")
map("n", "gd", "<Cmd>lua require('vscode-neovim').action('editor.action.revealDefinition')<CR>")
map("n", "gi", "<Cmd>lua require('vscode-neovim').action('editor.action.goToImplementation')<CR>")
map("n", "<space>D", "<Cmd>lua require('vscode-neovim').action('editor.action.goToTypeDefinition')<CR>")
map("n", "<space>rn", "<Cmd>lua require('vscode-neovim').action('editor.action.rename')<CR>")

-- LSP
map('n', 'K', function() code.call('editor.action.showHover') end)
map('n', '<Leader>e', function() code.call('workbench.view.explorer') end)
map('n', '<leader>s', function() code.call('workbench.action.gotoSymbol') end)
map('n', '<leader>S', function() code.call('workbench.action.showAllSymbols') end)
map('n', '<leader>ca', function() code.call('editor.action.quickFix') end)
map('n', '<leader>k', function() code.call('editor.action.showHover') end)
map('n', '<leader>h', function() code.call('editor.action.showDefinitionPreviewHover') end)

-- fold
map('n', 'zo', function() code.call('editor.toggleFold') end)


-- insert mode movements
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- save
vim.keymap.set("n", "<leader>w", function() code.call('workbench.action.files.save') end)
vim.keymap.set("n", "<leader>W", function() code.call('workbench.action.files.save') end)
