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

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
