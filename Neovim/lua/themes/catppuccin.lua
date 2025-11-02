-- Catppuccin Theme Setup for Neovim (Dark - Mocha)

-- Original Theme: https://github.com/catppuccin/nvim
-- Created by the Catppuccin Team

-- Integrated with nvim-tree, telescope, which_key, notify

local pacman = require("toolkits.pacman")

pacman.use("https://github.com/catppuccin/nvim", function()
    require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
            nvimtree = true,
            telescope = true,
            which_key = true,
            notify = true,
        },
    })

    vim.cmd("colorscheme catppuccin")
end, "catppuccin", "https://api.github.com/repos/catppuccin/nvim/contents/lua/catppuccin")
