local utils = require('utils')

 -- clear highlights
utils.map('n', '<C-l>', '<cmd>noh<CR>')

-- resize windows
utils.map('n', '<C-Left>', ':vertical resize +3 <CR>', { noremap = true, silent = true } )
utils.map('n', '<C-Right>', ':vertical resize -3 <CR>', { noremap = true, silent = true } )
utils.map('n', '<C-Up>', ':resize -3 <CR>', { noremap = true, silent = true } )
utils.map('n', '<C-Down>', ':resize +3 <CR>', { noremap = true, silent = true } )

-- move split windows around
utils.map('n', '<leader>th', '<C-W>t<C-w>H', { noremap = true, silent = true } )
utils.map('n', '<leader>tk', '<C-W>t<C-w>K', { noremap = true, silent = true } )

-- fix last mispelled word to first listed correction while in insert
utils.map('i', '<C-h>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { noremap = true, silent = true } )

