--[[

    Plugins *required* for other plugins, such as LSPs or fuzzy searches (ex: Telescope) to
    work properly.

]]

local pacman = require("core.pacman")

pacman.use("https://github.com/nvim-lua/plenary.nvim", function() end, "plenary")

pacman.use("https://github.com/neovim/nvim-lspconfig", function() end, "lspconfig")

pacman.use("https://github.com/glepnir/lspsaga.nvim", function() end, "lspsaga")

pacman.use("https://github.com/williamboman/mason.nvim", function() end, "mason")

pacman.use("https://github.com/williamboman/mason-lspconfig.nvim", function() end, "mason-lspconfig")

pacman.use("https://github.com/nvim-treesitter/nvim-treesitter", function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"typescript",
			"javascript",
			"python",
			"rust",
			"java",
			"c",
			"cpp"
		},
		highlight = {
			enable = true
		},
		indent = {
			enable = true
		},
	})
end, "nvim-treesitter")

pacman.use("https://github.com/nvim-tree/nvim-web-devicons", function() end, "nvim-web-devicons")
