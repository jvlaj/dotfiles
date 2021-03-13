call plug#begin('~/.local/share/nvim/site/autoload/')
" colorschemes
Plug 'felipec/vim-felipec'

" list of plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'preservim/nerdtree'
Plug 'vim-latex/vim-latex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ferrine/md-img-paste.vim'
Plug 'jakykong/vim-zim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'vim-voom/VOoM'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}
Plug 'honza/vim-snippets'
Plug 'bfrg/vim-cpp-modern'
Plug 'conornewton/vim-pandoc-markdown-preview'
Plug 'lervag/vimtex'
Plug 'miyakogi/seiya.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting

call plug#end()

source $HOME/.config/nvim/plug-config/coc.vim

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

let g:mapleader=" "
syntax on

set laststatus=1

set undodir=~/.vim/undodir
set undofile
set number relativenumber tabstop=4 shiftwidth=4 softtabstop=4 noerrorbells smarttab smartindent expandtab autoindent
syntax on
set wrap breakindent
set nu
set smartcase
set noswapfile
set incsearch

set mouse=a

set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
let g:deus_termcolors=256

let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']

"clangd
let g:clang_format#auto_format=1

"vim-cpp-modern
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

" TABLINE

"set tabline=%!MyTabLine()
"
"function MyTabLine()
"	let s = ''
"	for i in range(tabpagenr('$'))
"		" select the highlighting
"		if i + 1 == tabpagenr()
"			let s .= '%#TabLineSel#'
"		else
"			let s .= '%#TabLine#'
"    	endif
"
"    	" set the tab page number (for mouse clicks)
"    	let s .= '%' . (i + 1) . 'T' 
"
"    	" the label is made by MyTabLabel()
"    	let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"  	endfor
"
"  	" after the last tab fill with TabLineFill and reset tab page nr
"  	let s .= '%#TabLineFill#%T'
"
"  	" right-align the label to close the current tab page
"  	if tabpagenr('$') > 1 
"    	let s .= '%=%#TabLine#%999XClose '
"  	endif
"
"  	return s
"endfunction
"
"function MyTabLabel(n)
"	let buflist = tabpagebuflist(a:n)
"	let winnr = tabpagewinnr(a:n)
"	let label =  bufname(buflist[winnr - 1]) 
"	return fnamemodify(label, ":t") 
"endfunction
"
" STATUSLINE

set laststatus=1
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=1
        set showcmd
    endif
endfunction

nnoremap <C-a> :call ToggleHiddenAll()<CR>

set rulerformat=%25(%)
set rulerformat+=%=
"set rulerformat+=%{&modified?'*':''}
set rulerformat+=\ %v:%l\ ~\ %p%%
set rulerformat+=\ \|\ %Y%*

" Plugin settings

"let g:limelight_conceal_ctermfg='240'
"let g:templates_directory = '~/.config/nvim/templates'

nnoremap <F4> :NERDTreeToggle<CR>

set completeopt=menuone,noinsert

"augroup pandocnotes
"	autocmd BufNewFile,BufRead *.mdown set filetype=markdown.pandoc
"	autocmd BufNewFile *.mdown r ~/.config/nvim/templates/template.mdown | set expandtab
"	"autocmd FileType pandoc set signcolumn=yes:2
"	autocmd FileType markdown.pandoc call Pandoc_mdown()
"	function Pandoc_mdown()
"		setlocal spell spelllang=en_ca
"		Goyo 120
"
"		let g:pdf_viewer = 'zathura'
"
"		let g:file = expand('%:p')
"		let g:pdf = "/tmp/" . expand('%:t:r') . ".pdf"
"
"		function NotesPreview()
"			" compile the pdf from this file, then start the pdf viewer "
"			silent execute '!pandoc' '-f markdown' '--filter pandoc-crossref' g:file '-o' g:pdf
"			silent execute '!' g:pdf_viewer g:pdf '&>/dev/null &'
"		endfunction
"
"		call NotesPreview()
"				" when saving, also recompile the pdf (this should update the viewer automatically) "
"		autocmd BufWritePost *.mdown execute '!pandoc' '-f markdown' '--filter pandoc-crossref' g:file '-o' g:pdf
"		
"		autocmd VimLeave *.mdown execute '!rm' g:pdf
"
"		nmap <C-p> :call NotesPreview()<CR>
"	endfunction

nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'


" FOLDING

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" LaTeX
set shellslash
let g:tex_flavor='latex'

" Pandoc-markdown
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#syntax#conceal#blacklist = ["dashes", "atx"]

" Pandoc Preview plugin
"let g:pandoc_preview_pdf_cmd="zathura"
"nnoremap <leader>v :PandocPreview<cr>
let g:md_pdf_viewer="zathura"
let g:vimtex_view_method = "zathura"

" Set colorscheme at end to prevent pandoc from overriding
set termguicolors
colorscheme sayo

" Colorizer
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html,conf,vim'

noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>f :FZF<CR>
