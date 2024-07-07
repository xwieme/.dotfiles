return {
	"nvim-treesitter/nvim-treesitter",
	-- opts = function(_, opts)
	-- 	print(opts.ensure_installed)
	-- 	if type(opts.ensure_installed) == "table" then
	-- 		vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
	-- 	end
	-- 	-- if type(opts.highlight.disable) == "table" then
	-- 	-- 	vim.list_extend(opts.highlight.disable, { "latex" })
	-- 	-- else
	-- 	opts.highlight.disable = { "latex" }
	-- 	-- end
	-- end,
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({

			ensured_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"r",
				"julia",
				"sql",
				"dockerfile",
				"latex",
				"bibtex",
				"json",
			},

			-- Install parsers synchronously
			sync_install = false,

			-- Automaticaly install missing parsers
			auto_install = true,

			highlight = {
				enable = true,
				disable = { "latex" },
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
