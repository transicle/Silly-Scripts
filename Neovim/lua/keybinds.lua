local KeybindManager = require("core.binder")

KeybindManager.map("n", "Control + Shift + M", function()
    if vim.o.mouse == "" then
        vim.o.mouse = "a"
    else
        vim.o.mouse = ""
    end
end)

KeybindManager.map("n", "Control + Shift + S", function()
    vim.cmd("write")
end)

KeybindManager.map("n", "Control + Left", function()
    local current = vim.fn.bufnr()
    local bufs = vim.fn.getbufinfo({bufloaded = 1})
    local idx
    
    for i, b in ipairs(bufs) do
        if b.bufnr == current then
            idx = i
            break
        end
    end
    if idx then
        local target = idx - 1
        if target < 1 then
            target = #bufs
        end

        vim.cmd("buffer " .. bufs[target].bufnr)
    end
end)

KeybindManager.map("n", "Control + Right", function()
    local current = vim.fn.bufnr()
    local bufs = vim.fn.getbufinfo({bufloaded = 1})
    local idx

    for i, b in ipairs(bufs) do
        if b.bufnr == current then
            idx = i
            break
        end
    end

    if idx then
        local target = idx + 1
        if target > #bufs then
            target = 1
        end

        vim.cmd("buffer " .. bufs[target].bufnr)
    end
end)

KeybindManager.map("v", "Control + Shift + A", function()
    vim.cmd("normal! ggVG")
end)

KeybindManager.map("n", "Control + Shift + Backspace", function()
    vim.cmd("normal! db")
end)

KeybindManager.map("v", "Control + Shift + C", function()
    vim.cmd('normal! "+y')
end)

KeybindManager.map("n", "Control + Shift + N", function()
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = false
end)
