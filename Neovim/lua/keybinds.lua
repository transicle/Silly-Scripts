local KeybindManager = require("toolkits.binder")

-- Close buffer or terminal
local function close_focused()
    local buffer_type = vim.bo.buftype
    if buffer_type == "terminal" then
        vim.cmd("bdelete!") -- Terminal buffer
    else
        vim.cmd("bdelete") -- Normal buffer
    end
end

KeybindManager.map("n", "Control + Shift + W", close_focused)

-- Copy / Paste / Cut
KeybindManager.map("n", "Control + Shift + C", '"+y')
KeybindManager.map("v", "Control + Shift + C", '"+y')
KeybindManager.map("n", "Control + Shift + V", '"+p')
KeybindManager.map("i", "Control + Shift + V", "<C-R>+")
KeybindManager.map("n", "Control + Shift + X", '"+d')
KeybindManager.map("v", "Control + Shift + X", '"+d')

-- Delete by word
KeybindManager.map("i", "Control + Shift + Backspace", "<C-w>")

-- Undo / Redo
KeybindManager.map("n", "Control + Shift + Z", "u")
KeybindManager.map("i", "Control + Shift + Z", "<Esc>u")
KeybindManager.map("n", "Control + Shift + Y", "<C-r>")
KeybindManager.map("i", "Control + Shift + Y", "<Esc><C-r>")

-- Split navigation
KeybindManager.map("n", "Control + H", "<C-w>h")
KeybindManager.map("n", "Control + J", "<C-w>j")
KeybindManager.map("n", "Control + K", "<C-w>k")
KeybindManager.map("n", "Control + L", "<C-w>l")

-- Split resizing
KeybindManager.map("n", "Control + Up", ":resize +2<CR>")
KeybindManager.map("n", "Control + Down", ":resize -2<CR>")
KeybindManager.map("n", "Control + Left", ":vertical resize -2<CR>")
KeybindManager.map("n", "Control + Right", ":vertical resize +2<CR>")

-- Save / Quit
KeybindManager.map("n", "Control + S", ":w<CR>")
KeybindManager.map("i", "Control + S", "<Esc>:w<CR>i")
KeybindManager.map("n", "Control + Q", ":q<CR>")
KeybindManager.map("i", "Control + Q", "<Esc>:q<CR>")

-- Buffer navigation
KeybindManager.map("n", "Shift + H", ":bprevious<CR>")
KeybindManager.map("n", "Shift + L", ":bnext<CR>")

-- Toggle relative numbers
KeybindManager.map("n", "Control + R", function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end)

-- Open last opened file (NOT terminal)
local last_file = nil
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    callback = function()
        if vim.bo.buftype ~= "terminal" then
            last_file = vim.fn.expand("%:p")
        end
    end
})

KeybindManager.map("n", "Control + Shift + T", function()
    if last_file and vim.fn.filereadable(last_file) == 1 then
        vim.cmd("edit " .. vim.fn.fnameescape(last_file))
    end
end)
