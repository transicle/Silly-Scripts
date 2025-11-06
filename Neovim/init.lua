-- Settings

vim.opt.termguicolors = true

if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.85
    vim.g.neovide_fullscreen = false
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_hide_mouse_when_typing = true

    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_cursor_vfx_particle_density = 15.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.0
    vim.g.neovide_cursor_vfx_particle_speed = 25.0
    vim.g.neovide_cursor_vfx_particle_phase = 1.8
    vim.g.neovide_cursor_vfx_particle_curl = 3

    vim.g.neovide_cursor_animation_length = 0.25
    vim.g.neovide_cursor_trail_size = 2.0
    vim.g.neovide_cursor_antialiasing = true

    vim.g.neovide_scroll_animation_length = 0.3
    vim.g.neovide_scroll_animation_far_lines = 0.6

    vim.g.neovide_floating_blur_amount_x = 8.0
    vim.g.neovide_floating_blur_amount_y = 8.0

    vim.g.neovide_padding_top = 25
    vim.g.neovide_padding_bottom = 25
    vim.g.neovide_padding_right = 25
    vim.g.neovide_padding_left = 25

    vim.g.transparency = 0.85
    vim.g.neovide_refresh_rate = 144
end

-- Load files

require("dependencies")

local path = vim.fn.stdpath("config") .. "/lua"

local function require_files(directory, prefix)
    prefix = prefix or ""

    for _, file in ipairs(vim.fn.readdir(directory)) do
        local full_path = directory .. "/" .. file
        local stat = vim.loop.fs_stat(full_path)

        if stat then
            if stat.type == "file" and file:match("%.lua$") and (
                file ~= "pacman.lua"        and
                file ~= "binder.lua"
            ) then
                require(prefix .. file:gsub("%.lua$", ""))
            elseif stat.type == "directory" then
                require_files(full_path, prefix .. file .. ".")
            end
        end
    end
end

require_files(path)
