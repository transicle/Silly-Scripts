local pacman = require("core.pacman")
local KeybindManager = require("core.binder")

pacman.use("https://github.com/akinsho/bufferline.nvim", function()
    local kanagawa = require("kanagawa.colors").setup()
    require("bufferline").setup({
    	highlights = {
        	fill = { bg = kanagawa.palette.wave_bg },
        	background = { fg = kanagawa.palette.fujiWhite, bg = kanagawa.palette.wave_bg },
        	buffer_visible = { fg = kanagawa.palette.sumiInk1, bg = kanagawa.palette.wave_bg },
        	buffer_selected = { fg = kanagawa.palette.sumiInk0, bg = kanagawa.palette.waveBlue, bold = true },
        	separator = { fg = kanagawa.palette.wave_bg, bg = kanagawa.palette.wave_bg },
        	separator_selected = { fg = kanagawa.palette.waveBlue, bg = kanagawa.palette.wave_bg },
        	close_button = { fg = kanagawa.palette.crystalBlue, bg = kanagawa.palette.wave_bg },
        	close_button_visible = { fg = kanagawa.palette.crystalBlue, bg = kanagawa.palette.wave_bg },
        	close_button_selected = { fg = kanagawa.palette.sumiInk0, bg = kanagawa.palette.waveBlue },
    	},
	options = {
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 30,
            max_prefix_length = 15,
            tab_size = 21,
            diagnostics = "nvim_lsp",
            show_buffer_close_icons = true,
            show_close_icon = true,
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            separator_style = "slant",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center"
                }
            },
        }
    })
end, "bufferline")

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
                        telescope_builtin.live_grep({
                            cwd = vim.loop.cwd()
                        })
                    end,
                    ["<C-c>"] = function(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        telescope_builtin.live_grep({
                            cwd = vim.fn.stdpath("config")
                        })
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

    KeybindManager.map("n", "Control + F", function()
        telescope_builtin.find_files({
            cwd = vim.fn.expand("~")
        })
    end)

    KeybindManager.map("n", "Alt + F", function()
        local cwd = vim.fn.expand("%:p:h")
        if cwd == "" then
            cwd = vim.loop.cwd()
        end

        telescope_builtin.find_files({
            cwd = cwd
        })
    end)
end, "telescope")
