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
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)

-- nvim R
-- vim.keymap.set('n', '<leader>t', '<leader>rf', { noremap = true, silent = true })

hook = {
   on_filetype = function()
       -- Creating maps to "<Plug>RDSendLine" and "<Plug>RSendSelection"
       -- will prevent R.nvim of creating its default maps to them.
       vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
       vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})

       -- vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>L", "<Cmd>lua require('r.run').action('levels')<CR>", {})

       -- If you want an action over an selection, then the second
       -- argument must be the string `"v"`:
       -- In this case, the beginning and the end of the selection must be
       -- in the same line.
       vim.api.nvim_buf_set_keymap(0, "v", "<leader>T", "<Cmd>lua require('r.run').action('head')<CR>", {})

       -- If a third optional argument starts with a comma, it will be
       -- inserted as argument(s) to the `action`:
       vim.api.nvim_buf_set_keymap(0, "n", "<leader>H", "<Cmd>lua require('r.run').action('head', 'n', ', n = 10')<CR>", {})

       -- object as argument, you can use `cmd()` from the `r.send` module
       -- to send it directly to R Console:
       vim.api.nvim_buf_set_keymap(0, "n", "<C-S-l>", "<Cmd>lua require('r.send').cmd('devtools::load_all(\".\")')<CR>", {})
   end,
}


