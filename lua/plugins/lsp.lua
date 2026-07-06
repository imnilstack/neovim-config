return {
    "neovim/nvim-lspconfig",

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
        })

        vim.lsp.config("pyright", {
            capabilities = capabilities,
        })

        vim.lsp.config("bashls", {
            capabilities = capabilities,
        })

        vim.lsp.enable({
            "lua_ls",
            "pyright",
            "bashls",
        })
    end,
}
