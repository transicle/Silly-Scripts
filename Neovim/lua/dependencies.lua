local pacman = require("toolkits.pacman")

pacman.use(
    "https://github.com/nvim-lua/plenary.nvim", function() end,
    "plenary"
)

pacman.use(
    "https://github.com/s1n7ax/nvim-window-picker", function() end,
    "window-picker",
    "https://api.github.com/repos/s1n7ax/nvim-window-picker/contents/lua/window-picker"
)

pacman.use(
    "https://github.com/antosha417/nvim-lsp-file-operations", function() end,
    "lsp-file-operations"
)

pacman.use(
    "https://github.com/neovim/nvim-lspconfig", function() end,
    "lspconfig"
)
