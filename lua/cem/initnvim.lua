require("cem.remap")
require("cem.lazy")
require("lazy").setup({
    require("cem.whichkey"),
    { "folke/neoconf.nvim",               cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    --    "TabbyML/vim-tabby",
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = vim.g.vscode,
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                enable = true,
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    'nvim-lua/plenary.nvim',
    {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'mbbill/undotree',
    require('cem.leap'),
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    require('cem.lspconfig'),
    require('cem.conform'),
    require('cem.nvimcmp'),
    require('cem.nvimlint'),
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    -- DART/Flutter
    { "dart-lang/dart-vim-plugin" },
    { "mfussenegger/nvim-dap" },
    {
        "akinsho/flutter-tools.nvim",
        enabled = vim.g.vscode,
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
        config = function()
            require('flutter-tools').setup {
                lsp = {
                    settings = {
                        lineLength = 120,
                        renameFilesWithClasses = "always",
                        documentation = "full",
                    }
                },
                debugger = {
                    enabled = false,
                    run_via_dap = false,
                    register_configurations = function(_)
                        require("dap").adapters.dart = {
                            type = "executable",
                            command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
                            args = { "flutter" }
                        }

                        require("dap").configurations.dart = {
                            {
                                type = "dart",
                                request = "launch",
                                name = "Launch flutter",
                                dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
                                flutterSdkPath = "home/flutter",
                                program = "${workspaceFolder}/lib/main.dart",
                                cwd = "${workspaceFolder}",
                            }
                        }
                        -- uncomment below line if you've launch.json file already in your vscode setup
                        -- require("dap.ext.vscode").load_launchjs()
                    end,
                },
                dev_log = {
                    enabled = true,
                    open_cmd = "tabedit",
                },
            }
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    require('cem.trouble'),
    require('cem.testing'),
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
require("cem.tokyonight")
require("cem.harpoon")
require("cem.undotree")
require("cem.lsp")
require("cem.set")
require("cem.toggleterm")
