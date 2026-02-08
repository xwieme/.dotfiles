return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' }, 
	dependencies = {
		'williamboman/mason.nvim',  
		'hrsh7th/cmp-nvim-lsp',  
		{ 'antosha417/nvim-lsp-file-operations', config = true },  
		{ 'folke/neodev.nvim', opts = {} },  
	},
	config = function()

		local lspconfig = require('lspconfig')
		local mason_lspconfig = require('mason-lspconfig')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		local keymap = vim.keymap

		-- Custom keybinds when LSP server attaches to buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				local function opts(desc)
					return { desc = desc, buffer = ev.buf, silent = true }
				end

				keymap.set('n', 'K', vim.lsp.buf.hover, opts('Show documentation'))
				keymap.set('n', 'gR', '<cmd>Telescope lsp_references<cr>', opts('Show LSP references'))
				keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('Go to declaration'))
				keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts('Show LSP definitions'))
				keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts('Show LSP implementations'))
				keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', opts('Show LSP type definitions'))
				keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, opts('Show available code actions'))
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()  

		-- -- Disable all diagnostics (warnings, errors etc.)
		-- local no_diagnostics = {
		-- 	['textDocument/publishDiagnostics'] = function(_, _, _, _, _)
		-- 		return
		-- 	end,
		-- }

		-- Specify handlers
		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					-- handlers = no_diagnostics,   
				})
			end,

			-- Lua LSP
			['lua_ls'] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					-- handlers = no_diagnostics,
					settings = {
						Lua = {
							diagnostics = { globals = { 'vim' } },
							completion = { callSnippet = 'Replace' },
						},
					},
				})
			end,

			-- Python LSP
			['pyright'] = function()
				lspconfig.pyright.setup({
					capabilities = capabilities,
					-- handlers = no_diagnostics,
				})
			end,

            -- Python ruff
            ['ruff'] = function()
                lspconfig.ruff.setup({
                    capabilities = capabilities,
                    handlers = no_diagnostics,
                })
            end,

			-- C LSP
			['clangd'] = function()
				lspconfig.clangd.setup({
					capabilities = capabilities,
					settings = {
						clangd = {
							fallbackFlags = { "-std=c11" },
						},
					},
				})
			end,

            -- Rust LSP
			['rust_analyzer'] = function()
			  lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
				  ['rust-analyzer'] = {
					cargo = { allFeatures = true },
					checkOnSave = {
					  command = "clippy"
					},
				  },
				},
			  })
			end,
		})
	end
}
