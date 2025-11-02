local pacman = require("toolkits.pacman")
local KeybindManager = require("toolkits.binder")

pacman.use("https://github.com/goolord/alpha-nvim", function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        "  ░██ ░██░██                      ░██                 ",
        "  ░██    ░██                                          ",
        "  ░██ ░██░██ ░██    ░██░██    ░██ ░██░█████████████   ",
        "  ░██ ░██░██ ░██    ░██░██    ░██ ░██░██   ░██   ░██  ",
        "  ░██ ░██░██ ░██    ░██ ░██  ░██  ░██░██   ░██   ░██  ",
        "  ░██ ░██░██ ░██   ░███  ░██░██   ░██░██   ░██   ░██  ",
        "  ░██ ░██░██  ░█████░██   ░███    ░██░██   ░██   ░██  ",
        "                    ░██                               ",
        "               ░███████                               ",
    }

    dashboard.section.buttons.val = {
        dashboard.button("N", "  Make New", ":ene <CR>"),         -- Shift   N
        dashboard.button("Alt + F", "  Find File", nil),          -- Alt     F
        -- dashboard.button("Alt + T", "󰙅  File Tree Preview", nil),  -- Alt     G
        dashboard.button("Q", "  Quit", ":qa<CR>"),               -- Shift   Q
    }

    local loaded, failed, skipped = pacman.stats()
    dashboard.section.footer.val = {
        string.format("Packages loaded: %d ⬩ Failed: %d ⬩ Skipped: %d", loaded, failed, skipped)
    }

    local height = vim.fn.winheight(0)
    if height == 0 then
        height = 24
    end
    
    local padding = math.floor((height - (#dashboard.section.header.val + #dashboard.section.buttons.val + #dashboard.section.footer.val + 8)) / 2)

    dashboard.config.layout = {
        {
            type = "padding",
            val = padding
        }, dashboard.section.header,
        {
            type = "padding",
            val = 2
        }, dashboard.section.buttons,
        {
            type = "padding",
            val = 2
        }, dashboard.section.footer
    }

    require("alpha").setup(dashboard.opts)
end, "alpha")
