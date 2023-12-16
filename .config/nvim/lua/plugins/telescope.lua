return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5', 
    dependencies = { 
        'nvim-lua/plenary.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        'nvim-tree/nvim-web-devicons',
    },
    config = function() 

        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                }
            }
        })

        telescope.load_extension("fzf");


        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc = "Fuzzy find files in cwd"})
        vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', {desc = "Find string in cwd"})
        vim.keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', {desc = "Find string under cursor in cwd"})

    end
}
