local indent = 4

vim.cmd('colorscheme murphy')
vim.cmd 'syntax on'
vim.cmd 'filetype plugin indent on'
vim.cmd('highlight clear conceal')

-- general settings
vim.o.laststatus = 1
vim.o.number = true
vim.o.relativenumber = true
vim.o.nu = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.mouse='a'
vim.o.termguicolors = true
vim.o.background='dark'
vim.o.updatetime=200 
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.b.shiftwidth = indent
vim.b.smartindent = true
vim.b.tabstop = indent
vim.b.undofile = true
vim.o.hidden = true
vim.o.history = 5000

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- markdown
vim.g['mdip_imgdir'] = 'res'
vim.cmd 'au FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>'

