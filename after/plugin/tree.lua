-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  renderer = {
    -- group_empty = true,
    -- icons = {
    --   show = {
    --     file = false,
    --     folder = false,
    --     folder_arrow = false,
    --     git = false
    --   },
    --   glyphs = {
    --     symlink = "",
    --   }
    -- },
    -- symlink_destination = false,
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
