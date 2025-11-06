local pacman = require("core.pacman")
local KeybindManager = require("core.binder")

pacman.use("https://github.com/kdheepak/lazygit.nvim", function()
	KeybindManager.map("n", "Alt + .", function()
		vim.cmd("LazyGit")
	end)
end, "lazygit")
