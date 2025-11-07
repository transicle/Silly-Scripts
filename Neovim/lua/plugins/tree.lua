local pacman = require("core.pacman")
local KeybindManager = require("core.binder")

pacman.use("https://github.com/nvim-tree/nvim-tree.lua", function()
	local tree = require("nvim-tree")
	local api = require("nvim-tree.api")

	tree.setup()
	KeybindManager.map("n", "Control + T", function()
		api.tree.open("~/")
	end)
	
	KeybindManager.map("n", "Alt + T", function()
		api.tree.open(vim.fn.expand("%:p:h"))
	end)

	KeybindManager.map("n", "Control + Shift + T", function()
	  api.tree.toggle()
	end)
end, "nvim-tree")
