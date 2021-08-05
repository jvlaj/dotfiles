vim.cmd('au FileType markdown,md,tex,text call pencil#init()')
vim.cmd('au FileType markdown,md,tex,text call lexical#init()')
vim.g["pencil#wrapModeDefault"] = "soft"
vim.g["pencil#concealcursor"] = "c"
vim.g["pencil#conceallevel"] = 3
vim.g["pencil#cursorwrap"] = 1
