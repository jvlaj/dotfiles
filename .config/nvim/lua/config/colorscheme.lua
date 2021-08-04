local utils = require('utils')
local cmd = vim.cmd
utils.opt('o', 'termguicolors', true)
cmd 'colorscheme minimalist'
cmd 'hi! clear Conceal'
