return {
    'nvim-treesitter/nvim-treesitter', 
    build = function () 
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true})
        ts_update()
    end,
    config = function()

        require('nvim-treesitter.configs').setup {

            ensured_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'python', 'r', 'julia', 'sql', 'dockerfile', 'latex', 'json' },
            
            -- Install parsers synchronously
            sync_install = false,

            -- Automaticaly install missing parsers 
            auto_install = true,

            highlight = {
                enable = true, 
                additional_vim_regex_highlighting = false,
            }
        }

    end 
}
