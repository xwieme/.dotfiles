return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("*", {})
        vim.lsp.enable({
            "lua_ls",
            "pyright",
            "ruff",
            "r_language_server",
            "rust_analyzer",
        })

        vim.diagnostic.config({ virtual_lines = true })

        vim.lsp.config("pyright", {
            settings = {
                pyright = {
                    disableOrganizeImports = true, -- Using Ruff
                },
                python = {
                    analysis = {
                        ignore = { '*' }, -- Using Ruff
                    },
                },
            },
        })
    end,
}
