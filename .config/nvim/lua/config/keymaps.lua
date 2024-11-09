-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true, -- do note show message
}

-----------------
-- Normal mode --
-----------------

-- Leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Move vertically and center view
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<S-g>", "<S-g>zz", opts)

-- Formatting
vim.keymap.set("n", "<leader>mp", function() vim.lsp.buf.format() end)

-- Create an autocmd that fires when an lsp client is attached
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        -- Create another autocmd that runs when the file is being saved
        vim.api.nvim_create_autocmd("BufWritePre", {
            -- Run only for the current buffer
            buffer = args.buf,
            callback = function()
                -- Format the file before writing to disk
                vim.lsp.buf.format { async = false, id = args.data.client_id }
            end,
        })
    end
})

-----------------
-- Insert mode --
-----------------

vim.keymap.set("i", "jj", "<Esc>", opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
