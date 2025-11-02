local pacman = require("toolkits.pacman")

pacman.use("https://github.com/williamboman/mason.nvim", function()
    require("mason").setup()
end, "mason", "https://api.github.com/repos/mason-org/mason.nvim/contents/lua/mason")

pacman.use("https://github.com/williamboman/mason-lspconfig.nvim", function()
    local mason_lsp = require("mason-lspconfig")
    local mason_registry = require("mason-registry")
    local languages = {
        "ts_ls",
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "clangd",
        "bashls",
        "html",
        "cssls",
        "jsonls",
        "vimls",
        "yamlls",
    }

    mason_lsp.setup({ ensure_installed = languages })

    for _, name in ipairs(languages) do
        local ok, pkg = pcall(mason_registry.get_package, name)
        if ok and not pkg:is_installed() then
            pkg:install()
        end
    end

    for _, server in ipairs(languages) do
        local cfg = vim.lsp.config[server]
        if cfg then
            vim.lsp.start(cfg)
        end
    end
end, "mason-lspconfig", "https://api.github.com/repos/mason-org/mason-lspconfig.nvim/contents/lua/mason-lspconfig")

pacman.use("https://github.com/nvim-treesitter/nvim-treesitter", function()
    local ts_configs = require("nvim-treesitter.configs")
    ts_configs.setup({
        ensure_installed = {
            "bash","c","cpp","css","go","html","javascript","json","lua",
            "python","rust","typescript","yaml","vim","java","markdown"
        },

        highlight = {
            enable = true
        },

        indent = {
            enable = true
        },

        auto_install = true,
    })

    require("nvim-treesitter.install").update({
        with_sync = true
    })
end, "nvim-treesitter")
