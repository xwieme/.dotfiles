return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
    },
    config = function()

		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local lspkind = require('lspkind')

		cmp.setup({
			completion = {
				completeopt = 'menu,menuone,preview',
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-j'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				['<Tab>'] = cmp.mapping.confirm({ select = true }),
			}),
			-- Enable completions from above
			sources = cmp.config.sources({
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'path' },
			}),
		})

		require("luasnip.loaders.from_vscode").lazy_load()  -- Load snippets
	end,
    -- opts = function()
    --     -- Register nvim-cmp lsp capabilities
    --     vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
    --
    --     local cmp = require("cmp")
    --     local defaults = require("cmp.config.default")()
    --     local auto_select = true
    --     return {
    --         auto_brackets = {},
    --         mapping = cmp.mapping.preset.insert({
    --             ["<C-j>"] = cmp.mapping.scroll_docs(-4),
    --             ["<C-k>"] = cmp.mapping.scroll_docs(4),
    --         }),
    --         sources = cmp.config.sources({
    --             { name = "nvim_lsp" },
    --             { name = "path" },
    --         }, {
    --             { name = "buffer" },
    --         }),
    --     }
    -- end,
}
