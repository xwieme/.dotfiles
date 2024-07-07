return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		vim.api.nvim_create_autocmd({ "FileType" }, {
			group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
			pattern = { "bib", "tex" },
			callback = function()
				vim.wo.conceallevel = 1
			end,
		})

		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
		vim.g.vimtex_view_general_viewer = "zathura"
	end,
}
