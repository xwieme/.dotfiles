-- define common options
local opts = {
    noremap = true,     -- non-recursive
    silent = true,      -- do note show message
}

-----------------
-- Normal mode --
-----------------

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

--Resize with arrows
-- delta = 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Insert mode --
-----------------

vim.keymap.set('i', 'jj', '<Esc>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

---------------
-- Telescope --
---------------
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)
vim.keymap.set('n', '<C-t>', '<cmd>Telescope live_grep<cr>', opts)

----------
-- Iron --
----------
vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
