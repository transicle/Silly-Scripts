local KeybindManager = require("toolkits.binder")

KeybindManager.map("n", "Control + T", function()
	vim.cmd(":botright 10split | terminal")
end)
