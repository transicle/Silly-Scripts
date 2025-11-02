local pacman = require("toolkits.pacman")
local KeybindManager = require("toolkits.binder")

-- pacman.use("https://github.com/nvim-tree/nvim-tree.lua", function()
--     require("nvim-tree").setup({
--         renderer = {
--             icons = {
--                 show = {
--                     file = true,
--                     folder = true,
--                     folder_arrow = true,
--                     git = true
--                 },

--                 glyphs = {
--                     default = "",
--                     symlink = "",
--                     folder = {
--                         default = "",
--                         open = "",
--                         empty = "",
--                         empty_open = "",
--                         symlink = "",
--                         symlink_open = "",
--                     },

--                     git = {
--                         unstaged = "✗",
--                         staged = "✓",
--                         unmerged = "",
--                         renamed = "➜",
--                         untracked = "★",
--                         deleted = "",
--                         ignored = "◌",
--                     },
--                 },
--             },

--             highlight_opened_files = "name",
--             group_empty = true,
--         },

--         view = {
--             width = 35,
--             side = "right",
--             number = false,
--             relativenumber = false,
--         },
--     })

--     local function open_on_startup()
--         local api = require("nvim-tree.api")
--         local stats = vim.loop.fs_stat(vim.fn.getcwd())

--         if stats and stats.type == "directory" then
--             api.tree.open()
--         end
--     end

--     -- vim.schedule(open_on_startup)
--     KeybindManager.map("n", "Alt + T", function()
--         require("nvim-tree.api").tree.toggle()
--     end)
-- end, "nvim-tree")
