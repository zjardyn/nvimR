return {
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
 
}
