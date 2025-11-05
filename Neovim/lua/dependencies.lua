--[[

    Plugins *required* for other plugins, such as LSPs or fuzzy searches (ex: Telescope) to
    work properly.

]]

local pacman = require("core.pacman")

pacman.use("https://github.com/nvim-lua/plenary.nvim", function() end, "plenary")

pacman.use("https://github.com/neovim/nvim-lspconfig", function() end, "lspconfig")

pacman.use("https://github.com/hrsh7th/nvim-cmp", function() end, "nvim-cmp")

pacman.use("https://github.com/hrsh7th/cmp-nvim-lsp", function() end, "cmp-nvim-lsp")

pacman.use("https://github.com/glepnir/lspsaga.nvim", function() end, "lspsaga")

pacman.use("https://github.com/mfussenegger/nvim-dap", function() end, "nvim-dap")

pacman.use("https://github.com/williamboman/mason.nvim", function() end, "mason")

pacman.use("https://github.com/williamboman/mason-lspconfig.nvim", function() end, "mason-lspconfig")
