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
