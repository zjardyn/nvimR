-- General Settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- proper colors
vim.opt.termguicolors = true

-- show insert mode in terminal buffers
vim.api.nvim_set_hl(0, 'TermCursor', { fg = '#A6E3A1', bg = '#A6E3A1' })

-- vim.o.signcolumn = "no"
vim.opt.signcolumn = 'yes:1'
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.autochdir = true
vim.opt.mouse = 'a' -- enable mouse
vim.opt.mousefocus = true

vim.opt.tabstop = 4       -- The width of a tab character
vim.opt.shiftwidth = 4    -- The width for auto-indents
vim.opt.expandtab = true  -- Convert tabs to spaces

vim.g.rout_follow_colorscheme = true

vim.opt.formatoptions:remove 'c'
vim.opt.formatoptions:remove 'r'
vim.opt.formatoptions:remove 'o'
vim.opt.scrolloff = 5

vim.opt.cmdheight = 1 -- hide cmdline when not used
-- vim.opt.showtabline = 1
-- vim.opt.winbar = '%f'

vim.opt.completeopt = 'menuone,noinsert' -- show autocomplete menu
vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false

-- smarter search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable fill chars (the ~ after the buffer)
vim.o.fillchars = 'eob: '

-- RNvim
vim.g.R_app = "radian"
vim.g.R_cmd = "R"

