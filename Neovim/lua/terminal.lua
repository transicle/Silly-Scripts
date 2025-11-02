local KeybindManager = require("toolkits.binder")

KeybindManager.map("n", "Control + `", function()
    vim.cmd("botright 10split | terminal")
    vim.cmd("startinsert")
end)
