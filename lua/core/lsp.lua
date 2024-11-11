-- Require Mason
require("mason").setup()

-- Require Mason-LSPConfig to automatically install LSP servers
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "ast_grep", "gopls", "clangd", "bashls"}, -- add LSP servers you want here
    automatic_installation = true,
})

-- Use Mason-LSPConfig to set up LSP servers with Neovim's LSP
local lspconfig = require('lspconfig')
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {}
    end,
})
