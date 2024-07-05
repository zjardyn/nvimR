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
    {'norcalli/nvim-colorizer.lua'},


})

require("moonfly").custom_colors({
    -- bg = "#161616",
    green = "#c6c684",
    khaki = "#85dc85",
    -- orchid = "#adadf3",
    -- lavender = "#e196a2",
    cranberry = "#ff308f"

})
vim.cmd [[colorscheme moonfly]]

-- vim.g.moonflyNormalFloat = true

require'colorizer'.setup()

vim.g.R_app = "radian"
vim.g.R_cmd = "R"

-- local moonfly = require('moonfly')
-- print(vim.inspect(moonfly.palette))

-- bay = "#4d5d8d",
-- bg = "#080808",
-- black = "#080808",
-- blue = "#80a0ff",
-- coral = "#f09479",
-- cranberry = "#e65e72", 
-- crimson = "#ff5189",
-- emerald = "#36c692", 
-- green = "#8cc85f",    
-- grey0 = "#323437",   
-- grey1 = "#373c4d",      
-- grey11 = "#1c1c1c",   
-- grey15 = "#262626", 
-- grey18 = "#2e2e2e", 
-- grey23 = "#3a3a3a", 
-- grey27 = "#444444", 
-- grey30 = "#4e4e4e", 
-- grey39 = "#626262", 
-- grey50 = "#808080", 
-- grey58 = "#949494", 
-- grey62 = "#9e9e9e", 
-- grey7 = "#121212", 
-- grey70 = "#b2b2b2", 
-- grey89 = "#e4e4e4", 
-- khaki = "#c6c684", 
-- lavender = "#adadf3", 
-- lime = "#85dc85", 
-- mineral = "#314940", 
-- orange = "#de935f", 
-- orchid = "#e196a2", 
-- purple = "#ae81ff", 
-- red = "#ff5454", 
-- sky = "#74b2ff", 
-- spring = "#00875f", 
-- turquoise = "#79dac8", 
-- violet = "#cf87e8", 
-- white = "#c6c6c6", 
-- yellow = "#e3c78a"














