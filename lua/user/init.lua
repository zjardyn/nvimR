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
    lazypath, })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    { "R-nvim/R.nvim",
    config = function ()
            -- Create a table with the options to be passed to setup()
            local opts = {
                R_args = {"--quiet", "--no-save"},
                hook = {
                    on_filetype = function ()
                    -- This function will be called at the FileType event
                    -- of files supported by R.nvim. This is an
                    -- opportunity to create mappings local to buffers.
                       vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                       vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})

                       -- vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>L", "<Cmd>lua require('r.run').action('levels')<CR>", {})
                       -- vim.api.nvim_buf_set_keymap(0, "v", "<leader>T", "<Cmd>lua require('r.run').action('head')<CR>", {})
                       -- vim.api.nvim_buf_set_keymap(0, "n", "<leader>H", "<Cmd>lua require('r.run').action('head', 'n', ', n = 10')<CR>", {})

                       vim.api.nvim_buf_set_keymap(0, "n", "<leader>L", "<Cmd>lua require('r.send').cmd('devtools::load_all(\".\")')<CR>", {})
                       vim.api.nvim_buf_set_keymap(0, "n", "<leader>C", "<Cmd>lua require('r.send').cmd('devtools::check()')<CR>", {})
                       vim.api.nvim_buf_set_keymap(0, "n", "<leader>P", "<Cmd>lua require('r.send').cmd('devtools::install()')<CR>", {})

                    end
                },
                min_editor_width = 18,
                rconsole_width = 57,
                disable_cmds = {
                        "RClearConsole",
                        "RCustomStart",
                        "RSPlot",
                        "RSaveClose",
                    },
                }
                -- Check if the environment variable "R_AUTO_START" exists.
                -- If using fish shell, you could put in your config.fish:
                -- alias r "R_AUTO_START=true nvim"
                if vim.env.R_AUTO_START == "true" then
                    opts.auto_start = 1
                    opts.objbr_auto_start = true
                end
                require("r").setup(opts)
            end,
    lazy = false,
    rproj_prioritise = { "pipe_version" },
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
  {'onsails/lspkind.nvim'}, {
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
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
      }
    },
    {'HiPhish/rainbow-delimiters.nvim'},
    {'norcalli/nvim-colorizer.lua'}
})

-- require("moonfly").custom_colors({
--         yellow = "#8cc85f",
--         green = "#e3c78a"
-- })

-- require("moonfly").custom_colors({
--     bg = "#121212",
--     violet = "#ff74b8",
-- })
-- vim.cmd([[colorscheme moonfly]])

require'colorizer'.setup()

vim.cmd [[colorscheme nightfly]]
-- vim.g.nightflyNormalFloat = true

vim.g.R_app = "radian"
vim.g.R_cmd = "R"


