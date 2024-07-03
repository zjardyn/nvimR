vim.o.signcolumn = "no"
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.autochdir = true

vim.opt.tabstop = 4       -- The width of a tab character
vim.opt.shiftwidth = 4    -- The width for auto-indents
vim.opt.expandtab = true  -- Convert tabs to spaces

