local pacman = require("core.pacman")

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
        dashboard.button("N", "  Make New", ":ene <CR>"),
        dashboard.button("Control + F, Alt + F", "  Find File", nil),
		dashboard.button("Alt + .", "  Open Git TUI", nil),
		dashboard.button("Alt + T, Control + Shift + T", "  Explorer", nil),
		dashboard.button("Control + I", "  Open Inline Chat", nil),
		dashboard.button("R", "  Recent Files", ":Telescope oldfiles<CR>"),
		dashboard.button("Q", "  Quit", ":qa<CR>"),
    }

    local loaded, failed, time = pacman.stats()
    dashboard.section.footer.val = {
    	string.format("Packages loaded: %d ⬩ Failed: %d ⬩ Loaded in %.2fs", loaded, failed, time)
    }

    local height = vim.fn.winheight(0)
    if height == 0 then
	    height = 24
    end
 
    local padding = math.floor((height - (#dashboard.section.header.val + #dashboard.section.buttons.val + #dashboard.section.footer.val + 8)) / 2)

    dashboard.config.layout = {
        { type = "padding", val = padding },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer
    }

    require("alpha").setup(dashboard.opts)
end, "alpha")
