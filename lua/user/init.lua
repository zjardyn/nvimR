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

require('lazy').setup("user.plugins")

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














