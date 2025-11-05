-- Asynchronous and minimal Neovim package manager. (Pacman)
--[[

    local pacman = require("core.pacman")
    
    pacman.use("link-to-repository", function()
        -- Your plugin logic here.
        -- FYI: You will need to require the plugin!
    end, "plugin-name")

]]

local uv = vim.loop
local loaded, failed = 0, 0
local time = 0

local function write_installer(url, name, callback)
    local path = vim.fn.stdpath("config") .. "/pack/plugins/start/" .. name

    local function finish()
        vim.cmd("packadd " .. name)
        vim.opt.rtp:prepend(path)

        if callback then
            callback()
        end
    end

    if vim.fn.isdirectory(path) == 0 then
        vim.fn.mkdir(vim.fn.stdpath("config") .. "/pack/plugins/start", "p")

        local result = vim.fn.system({ "git", "clone", "--depth=1", url, path })
        if vim.v.shell_error ~= 0 then
            vim.notify("Couldn't clone " .. url .. "\n" .. result, vim.log.levels.ERROR)

            if callback then
                callback(false)
            end
            return
        end
        finish()
    else
        finish()
    end
end

local function use(url, callback, name)
    local start = uv.hrtime()
    write_installer(url, name, function(success)
        local ok = pcall(require, name)
        if ok then
            loaded = loaded + 1
            if callback then
                callback()
            end
        else
            failed = failed + 1
        end

        time = time + ((uv.hrtime() - start) / 1e6)
    end)
end

local function stats()
    return loaded, failed, time
end

return {
    use = use,
    stats = stats
}
