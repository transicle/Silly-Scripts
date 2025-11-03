-- Discord RPC :3

pacman.use("https://github.com/andweeb/presence.nvim", function()
	require("presence").setup({
		auto_update = true,
		neovim_image_text = "Writing code in Neovim",
		main_image = "neovim",
		show_time = true,

		editing_text = function(filename) 
			return string.format("Modifying %s", filename or "Something")
		end,

		git_commit_text = "Publishing Changes",
		reading_text = function(filename)
			local line = vim.fn.line(".")
			local total = vim.fn.line("$")
			
			return string.format("Reading %s — Line %d/%d", filename or "something", line, total)
		end,

		workspace_text = "Working on %s",
	})
end, "presence", "https://api.github.com/repos/andweeb/presence.nvim/contents/lua/presence")
