require("user.remapping")
require("user.settings")

-- boostrap lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
 { 'rose-pine/neovim', name = 'rose-pine',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    "R-nvim/R.nvim",
    lazy = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  },
  "R-nvim/cmp-r",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({ sources = {{ name = "cmp_r" }}})
      require("cmp_r").setup({ })
    end,
  },
  -- language
  {'sar/cmp-lsp.nvim'},
  {'hrsh7th/cmp-vsnip'},
  {'hrsh7th/vim-vsnip'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-cmdline'},
  {'jalvesaq/cmp-zotcite'},

 --  {
	-- "L3MON4D3/LuaSnip",
	-- -- follow latest release.
	-- version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- -- install jsregexp (optional!).
	-- build = "make install_jsregexp"
 --   },


  -- {'hrsh7th/nvim-cmp'},
  {'onsails/lspkind.nvim'},
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {'nvim-tree/nvim-tree.lua'},
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = true
  },
  { 'mrjones2014/smart-splits.nvim' },
  { 'nvim-lualine/lualine.nvim', },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'numToStr/FTerm.nvim'},
})



