local utils = require('utils')
local cmd = vim.cmd
utils.opt('o', 'termguicolors', true)
cmd 'colorscheme dracula'
cmd 'hi! clear Conceal'
