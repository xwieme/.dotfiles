vim.opt.clipboard = 'unnamedplus'	-- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'			-- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4		-- number of visual spaces per TAB
vim.opt.softtabstop = 4		-- number of spaces in tab when editting
vim.opt.shiftwidth = 4		-- insert 4 spaces on a TAB
vim.opt.expandtab = true	-- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true		-- show absolute line number
vim.opt.relativenumber = true	-- add number to each line on the left side
vim.opt.cursorline = true	-- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true	-- open new vertical split bottom
vim.opt.splitright = true	-- open new horizontal splits right
vim.opt.showmode = false	-- don't show "-- INSERT --"

-- Searching
vim.opt.incsearch = true	-- search as characters are entered
vim.opt.hlsearch = false	-- do not highlight matches
vim.opt.ignorecase = true	-- ignore case in searches by default
vim.opt.smartcase = true	-- but make it case sensitive if an uppercase is entered

-- disable netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Leader key
vim.g.mapleader = " "
