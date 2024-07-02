vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remove search highlights
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", {silent = true})

-- jump between windows
-- vim.keymap.set("n", "<M-h>", "<C-w>h", {silent = true})
-- vim.keymap.set("n", "<M-j>", "<C-w>j", {silent = true})
-- vim.keymap.set("n", "<M-k>", "<C-w>k", {silent = true})
-- vim.keymap.set("n", "<M-l>", "<C-w>l", {silent = true})

-- resize windows
-- vim.keymap.set("n", "<C-h>", ":vertical resize +5<CR>", {silent = true})
-- vim.keymap.set("n", "<C-l>", ":vertical resize -5<CR>", {silent = true})
-- vim.keymap.set("n", "<C-j>", ":resize +5<CR>", {silent = true})
-- vim.keymap.set("n", "<C-k>", ":resize -5<CR>", {silent = true})

-- repeated indenting in visual mode
vim.keymap.set("v", ">", ">gv", {silent = true})
vim.keymap.set("v", "<", "<gv", {silent = true})

-- buffer stuff
vim.keymap.set("n", "gn", vim.cmd.bnext)
vim.keymap.set("n", "gp", vim.cmd.bprevious)
vim.keymap.set("n", "bd", vim.cmd.bdelete)


