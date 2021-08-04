local utils = require('utils')

local indent = 4
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

utils.opt('w','number',true)
utils.opt('w','nu',true)
utils.opt('w','relativenumber',true)
utils.opt('w','conceallevel',0)
utils.opt('o','laststatus',1)
utils.opt('o','ignorecase',true)
utils.opt('o','smartcase',true)
utils.opt('o','incsearch',true)
utils.opt('o','mouse','a')
utils.opt('o','termguicolors',true)
utils.opt('o','background','dark')
utils.opt('o','updatetime',200)
utils.opt('o','smarttab',true)
utils.opt('o','splitbelow',true)
utils.opt('o','splitright',true)
utils.opt('b','shiftwidth',indent)
utils.opt('b','smartindent',true)
utils.opt('b','tabstop',indent)
utils.opt('b','undofile',true)
utils.opt('o','hidden',true)
utils.opt('o','history',5000)

vim.cmd ('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')

-- markdown
vim.g.mdip_imgdir = 'res'
vim.cmd ('au FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>')

-- markdown-preview
vim.g.mkdp_browser = 'firefox'

-- pandoc
vim.g.pandoc_preview_pdf_cmd='zathura'
vim.g["pandoc#syntax#conceal#use"] = 2
--vim.cmd('au BufWritePost,FileWritePost *.md, execute ":PandocCompile"')

-- writing
vim.cmd('au FileType markdown,md,tex,text call pencil#init()')
vim.cmd('au FileType markdown,md,tex,text call lexical#init()')
vim.g["pencil#concealcursor"] = "c"
vim.g["pencil#conceallevel"] = 2
vim.g["pencil#cursorwrap"] = 1

