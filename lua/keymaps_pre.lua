local keymap = vim.keymap.set
local opts = { silent = true }

-- Must happen before plugins are required (otherwise wrong leader will be used)
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- Same for `maplocalleader`

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<CS-Up>", ":resize -2<CR>", opts)
keymap("n", "<CS-Down>", ":resize +2<CR>", opts)
keymap("n", "<CS-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<CS-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap({'n', 'v'}, '<DS-e>', ':NvimTreeOpen<CR>', opts)

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
