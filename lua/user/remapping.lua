vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remove search highlights
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", {silent = true})

-- repeated indenting in visual mode
vim.keymap.set("v", ">", ">gv", {silent = true})
vim.keymap.set("v", "<", "<gv", {silent = true})

-- buffer stuff
vim.keymap.set("n", "gn", vim.cmd.bnext)
vim.keymap.set("n", "gp", vim.cmd.bprevious)
vim.keymap.set("n", "bd", vim.cmd.bdelete)

-- nvim tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- nvim R
vim.keymap.set('n', '<leader>t', '<leader>rf', { noremap = true, silent = true })
