local pacman = require("toolkits.pacman")
local KeybindManager = require("toolkits.binder")

pacman.use("https://github.com/nvim-telescope/telescope.nvim", function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local telescope_builtin = require("telescope.builtin")

    telescope.setup({
        defaults = {
            layout_config = {
                width = 0.85,
                height = 0.85,
                prompt_position = "top",
            },
            
            sorting_strategy = "ascending",
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-h>"] = function(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        telescope_builtin.find_files({ cwd = vim.fn.expand("~") })
                    end,
                },
            },
        },

        pickers = {
            find_files = {
                hidden = true,
            },
        },
    })

    KeybindManager.map("n", "Alt + F", function()
        local cwd = vim.fn.expand("%:p:h")
        if cwd == "" then
            cwd = vim.loop.cwd()
        end
        
        require("telescope.builtin").find_files({ cwd = cwd })
    end)
end, "telescope", "https://api.github.com/repos/nvim-telescope/telescope.nvim/contents/lua/telescope")
