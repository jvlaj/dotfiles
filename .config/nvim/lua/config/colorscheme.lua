local utils = require('utils')
local cmd = vim.cmd
utils.opt('o', 'termguicolors', true)
cmd 'colorscheme sayo'
cmd 'hi! clear Conceal'
