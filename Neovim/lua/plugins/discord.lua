local pacman = require("core.pacman")

pacman.use("https://github.com/andweeb/presence.nvim", function()
    require("presence"):setup({
        auto_update = true,
        neovim_image_text = "Neovim :3", 
        main_image = "neovim",
        editing_text = "Reading & changing %s",
        reading_text = "Reading %s",
        debounce_timeout = 10,
        show_time = true,
    })
end, "presence")
