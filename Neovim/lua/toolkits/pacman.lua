--[[

                    Very basic Neovim package manager used in my configuration !!

    It's not that good of a package manager, so I added tons of failsafes for manual installations..

                                        November 2nd, 2025

]]

local developer_mode = false -- "true" removes and re-downloads *all* packages

local LC = 0
local FC = 0
local SC = 0

local function get_plugin_name(repo, override_api_link)
    local cmd
    if override_api_link then
        cmd = string.format("curl -s %s", override_api_link)
    else
        cmd = string.format("curl -s https://api.github.com/repos/%s/contents/lua", repo)
    end

    local result = vim.fn.system(cmd)
    local ok, data = pcall(vim.fn.json_decode, result)
    if not ok or type(data) ~= "table" then
        return "init"
    end

    local first_lua
    for _, file in ipairs(data) do
        if file.name:match("%.lua$") then
            if file.name == "init.lua" then
                return "init"
            elseif not first_lua then
                first_lua = file.name:gsub("%.lua$", "")
            end
        end
    end

    return first_lua or "init"
end

local function write_installer(url, override_name)
    local name = override_name or url:match(".*/(.-)%.git$") or url:match(".*/(.-)$")
    local install_path = vim.fn.stdpath("config") .. "/pack/plugins/start/" .. name

    if developer_mode and vim.fn.isdirectory(install_path) == 1 then
        vim.fn.delete(install_path, "rf")
    end

    local already_installed = vim.fn.isdirectory(install_path) == 1

    if not already_installed then
        vim.fn.mkdir(vim.fn.stdpath("config") .. "/pack/plugins/start", "p")
        vim.fn.system({ "git", "clone", "--depth=1", url, install_path })
    end

    vim.cmd("packadd " .. name)
    vim.opt.rtp:prepend(install_path)

    return name, not already_installed
end

local function use(url, callback, override_guessed_package_name, override_api_link, run)
    local repo = url:gsub("https://github.com/", "")
    local name = get_plugin_name(repo, override_api_link)
    
    local _, installed_now = write_installer(url)

    if override_guessed_package_name then
        name = override_guessed_package_name
    end

    local ok, plugin = pcall(require, name)
    if ok then
        LC = LC + 1

        if callback then
            callback()
        end
    else
        FC = FC + 1
    end

    if run then
        vim.fn.system("nvim --headless -es -c '" .. run .. "' -c 'qa'")
    end
end

local function stats()
    return LC, FC, SC
end

return {
    use = use,
    stats = stats,
}
