local KeybindManager = require("core.binder")

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",          -- Python
        "ts_ls",            -- TypeScript/JavaScript
        "bashls",           -- Bash
        "clangd",           -- C/C++
        "rust_analyzer",    -- Rust
        "gopls",            -- Go
        "lua_ls",           -- Lua
        "html",             -- HTML
        "cssls",            -- CSS
        "jsonls",           -- JSON
        "dockerls",         -- Docker
    },
})

local mason_registry = require("mason-registry")

local on_attach = function(client, bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    KeybindManager.map("n", "Control + K", function()
        vim.lsp.buf.hover()
    end)

    KeybindManager.map("n", "Control + D", function()
        vim.lsp.buf.definition()
    end)

    KeybindManager.map("n", "Control + R", function()
        vim.lsp.buf.references()
    end)

    KeybindManager.map("n", "Super + R", function()
        vim.lsp.buf.rename()
    end)

    KeybindManager.map("n", "Super + A", function()
        vim.lsp.buf.code_action()
    end)
end

local lspconfig = require("lspconfig")
local servers = {
    "pyright",
    "ts_ls",
    "bashls",
    "clangd",
    "rust_analyzer",
    "gopls",
    "lua_ls",
    "html",
    "cssls",
    "jsonls",
    "dockerls"
}

for _, name in ipairs(servers) do
    local ok, pkg = pcall(mason_registry.get_package, name)
    if ok and not pkg:is_installed() then
        pkg:install()
    end
end

for _, server in ipairs(servers) do
    local cfg = vim.lsp.config[server]
    if cfg then
        vim.lsp.start(cfg)
    end
end

require("lspsaga").setup({
    ui = {
        border = "rounded",
        title = true,
        winblend = 20,
        colors = { normal_bg = "#1f2335" }
    }
})

--[[
local dap = require("dap")
dap.adapters.lldb = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

KeybindManager.map("n", "F5",                   function() dap.continue()           end)
KeybindManager.map("n", "F10",                  function() dap.step_over()          end)
KeybindManager.map("n", "F11",                  function() dap.step_into()          end)
KeybindManager.map("n", "F12",                  function() dap.step_out()           end)
KeybindManager.map("n", "Control + Shift + b",  function() dap.toggle_breakpoint()  end)
KeybindManager.map("n", "Control + Shift + B",  function() dap.set_breakpoint()     end)
]]
