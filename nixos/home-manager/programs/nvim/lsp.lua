local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.enable("pyrefly")
vim.lsp.enable("ruff")
vim.lsp.enable("nixd")
vim.lsp.enable("r_language_server")

vim.lsp.config("pyrefly", { capabilities = capabilities })
vim.lsp.config("ruff", { capabilities = capabilities })
vim.lsp.config("nixd", { capabilities = capabilities })
vim.lsp.config("r_language_server",{ capabilities = capabilities })
