local utils = require('utils')
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.cmd [[set shortmess+=c]]
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_smart_case = 1
vim.g.completion_timer_cycle=100
vim.g.completion_menu_length = 4
