local pacman = require("core.pacman")
local KeybindManager = require("core.binder")

pacman.use("https://github.com/github/copilot.vim", function()
	vim.g.copilot_no_tab_map = true
	vim.g.copilot_assume_mapped = true
	vim.g.copilot_tab_fallback = ""
	vim.cmd("Copilot enable")
end, "copilot")

pacman.use("https://github.com/olimorris/codecompanion.nvim", function()
	local ai = require("codecompanion")
	ai.setup({
		opts = {
			log_level = "DEBUG"
		}
	})

	KeybindManager.map("n", "Control + I", function()
		vim.cmd("CodeCompanionChat")
		vim.cmd("vertical resize 60")
	end)
end, "codecompanion")
