return {
    "neovim/nvim-lspconfig",
    config = function()
        -- C
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.html.setup({
            capabilities = capabilities,
        })

        lspconfig.cssls.setup({
            capabilities = capabilities,
        })

        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })
    end,
    -- vim.lsp.enable("pyright"),
    -- vim.lsp.enable("lua_ls"),
    -- vim.lsp.enable("html"),
    -- vim.lsp.enable("cssls"),
    -- vim.lsp.enable("ts_ls"),
}
